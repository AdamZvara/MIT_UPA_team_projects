# Dokumentová databáza

**Názov**: Pocitová mapa míst 2023<br>
**Odkaz**: https://opendata.ostrava.cz/soubory/DatovyPortal/pocitova_mapa_2023.csv<br>
**Distribúcia**: CSV<br>
**Druh databázy**: MongoDB<br>

Pocitová mapa miest obsahuje miesta, ktoré zaznamenali respondenti do online mapy v rámci tvorby strategického plánu mesta Ostrava.
Záznamy datasetu obsahujú povinné položky: ID užívateľa (login), súradnice miesta, mestský obvod a typ pocitu (Miesto kde sa cítim/necítim dobre,
miesto ktoré by som odporučil návštevníkom, miesto ktoré by sa malo rozvíjať). Zároveň však obsahujú aj nepovinné položky ako je komentár,
vek a pohlavie. Z toho dôvodu je vhodné využitie databázy s flexibilným schématom, ktorá umožní ukladanie dokumentov s rôznymi atribútmi a zároveň
podporuje doplnenie schématu o potenciálne zaujímavé informácie do budúcna.

Ďalší z dôvodov použitia MongoDB je horizontálna škálovateľnosť. Dataset obsahuje 24 tisíc záznamov od vyše 1000 užívateľov. V tomto prípade
nevieme odhadnúť frekvenciu zápisov (jedná sa o sumár roku 2023, záznamy nemajú časovú značku), avšak pri pravidelnom aktualizovaní (v priebehu zberu
dát pre ďalšie obdobie) by mohlo dôjsť ku zvýšeniu priestorových nárokov. MongoDB umožňuje jednoduché horizontálne škálovanie, čo znamená, že pri
zvýšení počtu dokumentov môžeme jednoducho pridať clustre a zvýšiť kapacitu databázy. Zároveň je žiadúce použitie databázy, ktorá umožňuje zmenenie
vložených dát pre prípady, kedy by užívateľ chcel zmeniť alebo doplniť informácie o mieste, ktoré zaznamenal.

V neposlednom rade je dôležité, že MongoDB podporuje geolokačné dáta a umožňuje vykonávať geografické dotazy. V tomto prípade je možné
využiť súradnice miesta na zobrazenie miest v okolí alebo na vyhľadanie miest v určitom rozsahu od zadaných súradníc. To môže slúžiť následnej
analýze dát a získaniu informácií o najfrekventovanejších miestach v okolí alebo o miestach, ktoré by mohli byť zaujímavé pre návštevníkov. Prípadne
môže byť zaujímavé filtrovanie nepríjemných miest alebo miest, ktoré by mohli byť ďalej rozvíjané a prispôsobiť plán úpravy mesta podľa požiadaviek obyvateľov (komentárov).

## Vloženie dát a definícia schématu

Dataset je dostupný iba vo formáte CSV, ktorý je podporovaný pre priame načítanie do MongoDB. Pred samotným načítaním datasetu som manuálne pozmenil názvy stĺpcov čisto
z praktického dôvodu (aby neobsahovali diakritiku a medzery). Všetky operácie nad datasetom som vykonal v docker kontajneri s aktívnou MongoDB inštanciou. Po spustení
databázy som importoval dáta z CSV súboru pomocou príkazu (`--headerline` - prvý riadok obsahuje hlavičky, `--ignoreBlanks` - ignoruje prázdne hodnoty):

```bash
mongoimport -d UPA -c pocit_mapa --type=csv --headerline --ignoreBlanks pocitova_mapa_2023.csv
```

Keďže MongoDB nedokáže automaticky rozpoznať typ súradníc z CSV súboru (ideálnejšie by bolo zvoliť GeoJSON distribúciu, ktorá však pri tomto datasete chýbala),
je potrebné ich transformovať do formátu GeoJSON. Z toho dôvodu som vytvoril nový stĺpec `location` a do neho uložil
súradnice v požadovanom formáte. Následne som vytvoril index pre rýchle vyhľadávanie podľa geolokačných dát (použité neskôr).
Tieto operácie som vykonal priamo v `mongosh`:

```
db.pocit_mapa.updateMany({}, [{ $set: { location: { type: "Point", coordinates: [ "$X", "$Y"]}}}])
db.pocit_mapa.createIndex({ location: "2dsphere" })
```

## Ukážka dotazov

Následne je možné vykonávať rôzne dotazy nad dátami, k čomu je praktické využitie agregačnej pipeline. V následujúcom príklade zisťujem počet recenzií jednotlivých typy pocitov
v okruhu konkrétneho miesta (napr. 100 metrov - môžeme prakticky považovať za jednu lokalitu). Výsledok je zoradený podľa počtu recenzií zostupne:

```
db.pocit_mapa.aggregate([
    {
        $geoNear: {
            near: { type: "Point", coordinates: [18.273579, 49.850449] },         /* súradnice miesta */
            distanceField: "distance",
            maxDistance: 100,                                                     /* 100 metrov */
            spherical: true                                                       /* použitie 2dsphere indexu */
        }
    },
    {
        $group: {
            _id: "$Pocit",                                                        /* zoskupenie podľa typu pocitu */
            count: { $count: {} }
        }
    },
    {
        $sort: {                                                                  /* zoradenie podľa počtu recenzií */
            count: -1
        }
    }
])
```

**Output:**

```bash
[
  { _id: 'Místo, kde se necítím dobře', count: 200 },
  { _id: 'Místo, které by se mělo rozvíjet', count: 74 },
  { _id: 'Místo, které doporučím návštěvníkům', count: 19 },
  { _id: 'Místo, kde se cítím dobře', count: 8 }
]
```

V závislosti od používania databázy by bolo praktické vytvoriť indexy aj nad inými poliami databázy, napr. `login` pre jednoduché vyhľadanie komentárov od užívateľa v
prípade, ak by ich chcel zmeniť alebo index nad `pocit` v kombinácií s `komentar` (jeho existencia) v prípade častého dotazovania sa na navrhované zmeny, ktoré
potom môžeme využiť pri tvorbe plánu rozvoja mesta. Príklad takéhoto využitia je v pozmenení predcházajúcej agregačnej pipeline, kde zobrazujeme komentáre k miestam,
ktoré by sa mali rozvíjať.

```
{
    $match: {
        Komentar: {$exists: true},                          /* filtrovanie príspevkov s komentárom */
        Pocit: "Místo, které by se mělo rozvíjet"           /* filtrovanie podľa typu pocitu */
    }
},
{
    $project: {
        _id: 0,                                             /* nezobrazovanie ID */
        Komentar: 1                                         /* zobrazenie komentára */
    }
}
```

**Output:**

```bash
[
  { Komentar: 'Zastávka Náměstí republiky' },
  { Komentar: 'Pokud "není možná" likvidace a návrat k historickému úrovňovému řešené ulice...'},
  { Komentar: 'Myslím, že už je to v plánu, ale Frýdlanstké mosty jsou v hrozném stavu, přstupní uzel, aktuálně nereprezuntující...' }
]
```

# Databáza časových radov

**Názov**: Dopravní přestupky dle data a místa spáchání v roce 2024<br>
**Odkaz**: https://opendata.ostrava.cz/soubory/DatovyPortal/prestupky/20240101_20240630_dopravniprestupky.csv<br>
**Distribúcia**: CSV<br>
**Druh databázy**: InfluxDB<br>

Dataset dopravných priestupkov spáchaných v roku 2024 obsahuje záznamy o priestupkoch, ktoré boli zaznamenané políciou v Ostrave. Pre
tento dataset sme zvolili databázu časových radov InfluxDB, ktorá je špeciálne navrhnutá pre ukladanie časových dát a ich analýzu.
Pri výbere vhodného datasetu pre túto databázu sme si uvedomovali, že tento dataset nemusí nevyhnutne predstavovať
najlepšie vyhovujúci príklad pre InfluxDB, avšak neboli sme schopní z voľne dostupných dát nájsť vhodnejší dataset (napríklad
merania z rôznych senzorov, pre ktoré by bola táto databáza vhodnejšia).

Záznamy datasetu sú vo formáte CSV a obsahujú následujúce informácie:
  - Číslo prípadu
  - Miesto priesupku (voľný text)
  - Identifikácia priestupku: číslo zákona, paragraf, odstavec, písmeno a bod
  - Dátum spáchania: deň, mesiac a rok

Využitie vlastností InfluxDB spočíva v možnosti rýchleho filtrovania a zoskupovania dát podľa časových značiek a ďalších atribútov, ktoré si
definujeme v následujúcej sekcii. Zároveň dataset obsahuje nemalé množstvo záznamov (cca 30 tisíc), pre ktoré je použitie distribuovanej
databázy vhodné.

## Vloženie dát a definícia schématu

V prvom rade je nutné prevedenie CSV formátu do Influx line protokolu pomocou priloženého skriptu `csv_to_influx.py`. Pred samotným
prevedením sme manuálne upravili chyby vyskytujúce sa v datasete, kvôli ktorým nemohol byť automaticky spracovaný alebo načítaný do
databázy. Medzi tieto chyby patrili:
  - chybný dátum: `0202-05-16` pre prípad s číslom `23945` (záznam sme vymazali)
  - miesto činu obsahuje (neescapnuté) úvodzovky a poruší automatizované spracovanie: `" v Ostravě na ulici Hlučínská /autobusová zastávka "Přívoz\,Hllučínská"/"` - čísla prípadov `7390`, `28975` (zo záznamov sme odstránili úvodzovky)
  - text v čísle prípadu: `10888-P` (zo záznamu sme odstránili `-P`)

Zaroveň sme transformovali dátum do formátu Unix časovej značky (v sekundách). V neposlednom rade je dôležité si premyslieť rozloženie jednotlivých
atribútov do tagov a fieldov. Zvolili sme variant, kde `measurement` obsahuje základné parametre typu priestupku, ktoré sú tvorené
trojicou `cislo_zakona-paragraf-odstavec`. Teda napríklad:
  - `361/2000-125c-1` - priestupok fyzickej osoby na premávke na pozemnej komunikácii
  - `361/2000-125f-1` - priestupok prevozovateľa vozidla
  - `168/1999-16-1` - porušenie registrácie vozidla

V prípade, že zákon je ďalej špecifikovaný písmenom a bodom, môžeme tieto informácie zahrnúť do tagov pre lepšie zoskupovanie a
filtrovanie (nie každý measurement obsahuje tieto tagy). Príkladom môže byť zákon `361/2000-125c-1`, ktorý môže byť ďalej
konkretizovaný na činy:
  - `pismeno=f,bod=2` - prekročenie rýchlosti o 40 km/h v obci alebo 50 km/h mimo obce
  - `pismeno=f,bod=3` - prekročenie rýchlosti o 20 km/h v obci alebo 30 km/h mimo obce
  - `pismeno=f,bod=8` - nedatie prednosti v jazde
  - `pismeno=i,bod=1` - nezastavenie vozidla na znamenie policajta

Každý záznam napokon obsahuje field `miesto` a `cislo_pripadu`. Teda celkový príklad záznamu v Influx Line protokole môže vyzerať nasledovne:

```
361/2000-125c-1,pismeno=k,bod=0 misto_cinu="v Klimkovicích po ulci Lidické, zastávka MHD",cislo_pripadu=0014 1698620400
```

Je zrejmé, že existuje viacero možností ako vytvoriť schéma databázy v závislosti od jej použitia. V tomto prípade sme sa rozhodli
pre variant, ktorý umožňuje rýchle filtrovanie a zoskupovanie podľa typu priestupku (tagy, nad ktorými je vytvorený index) ale napríklad neumožňuje
zoskupovanie podľa miesta činu (field). V prípade, že by sme chceli zoskupovať podľa miesta, mohli by sme zvoliť variant, kde `misto_cinu` je tag
a `cislo_pripadu` je field.

Všetky operácie nad datasetom sme vykonali v docker kontajneri s aktívnou InfluxDB inštanciou (verzia 1.8.10 kompatibilná s príkladmi
z prednášok). Po spustení databázy sme vytvorili databázu `driving_tickets`:

```bash
influx -execute 'CREATE DATABASE driving_tickets'
```

Následne môžeme importovať dáta z prevedeného CSV súboru (vznikol z `csv_to_influx.py`):

```bash
root@e5bc91132687:/# influx -import -path=tickets.txt -precision=s -database=driving_tickets
2024/11/02 16:55:31 Processed 1 commands
2024/11/02 16:55:31 Processed 29736 inserts
2024/11/02 16:55:31 Failed 0 inserts
```

## Ukážka dotazov

Nad dátami následne vieme realizovať rozličné dotazy, napríklad na vypísanie miest všetkých priestupkov spojených s prekročením rýchlosti
v máji (5. mesiac) 2024 (realizované v InfluxQL):

```sql
SELECT misto_cinu FROM "361/2000-125c-1" WHERE pismeno='f' AND (bod='2' OR bod='3' OR bod='4') AND time > '2024-05-01 00:00:00' AND time < '2024-05-31 23:59:59'
```

**Output:**

```
2024-05-01T22:00:00Z na dálnici D1 v 366,9 km ve směru jízdy na Brno
2024-05-02T22:00:00Z na dálnici D1 na 367 km ve směru na Brno
2024-05-02T22:00:00Z č.p. 134/25, přechod
...
```

Prípadne nás môže zaujímať celkový počet prípadov prerušenia pravidiel premávky v jednotlivých mesiacoch na prelome rokov 2023/2024:

```sql
SELECT count(cislo_pripadu) FROM "361/2000-125c-1" WHERE time > '2023-08-01' GROUP BY time(4w)
```

**Output:**

```
2023-07-06T00:00:00Z 0
2023-08-03T00:00:00Z 4
2023-08-31T00:00:00Z 15
2023-09-28T00:00:00Z 11
2023-10-26T00:00:00Z 49
2023-11-23T00:00:00Z 155
2023-12-21T00:00:00Z 195
2024-01-18T00:00:00Z 249
2024-02-15T00:00:00Z 266
2024-03-14T00:00:00Z 240
2024-04-11T00:00:00Z 227
2024-05-09T00:00:00Z 221
2024-06-06T00:00:00Z 23
...
```