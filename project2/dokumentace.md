## Dokumentová databáza

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

Dataset je dostupný iba vo formáte CSV, ktorý je podporovaný pre priame načítanie do MongoDB. Pred samotným načítaním datasetu som manuálne pozmenil názvy stĺpcov čisto
z praktického dôvodu (aby neobsahovali diakritiku a medzery). Všetky operácie nad datasetom som vykonal v docker kontajneri s aktívnou MongoDB inštanciou. Po spustení
databázy som importoval dáta z CSV súboru pomocou príkazu (`--headerline` - prvý riadok obsahuje hlavičky, `--ignoreBlanks` - ignoruje prázdne hodnoty):

```
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

čo vráti výsledok:

```
[
  { _id: 'Místo, kde se necítím dobře', count: 200 },
  { _id: 'Místo, které by se mělo rozvíjet', count: 74 },
  { _id: 'Místo, které doporučím návštěvníkům', count: 19 },
  { _id: 'Místo, kde se cítím dobře', count: 8 }
]
```

V závislosti od používania databázy by bolo praktické vytvoriť indexy aj nad inými poliami databázy, napr. `login` pre jednoduché vyhľadanie komentárov od užívateľa v prípade,
ak by ich chcel zmeniť alebo index nad `pocit` v kombinácií s `komentar` (jeho existencia) v prípade častého dotazovania sa na navrhované zmeny, ktoré
potom môžeme využiť pri tvorbe plánu rozvoja mesta. Príklad takéhoto využitia je v pozmenení predcházajúcej agregačnej pipeline, kde zobrazujeme komentáre k miestam, ktoré by sa mali rozvíjať.

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

Kde výsledkom je zoznam komentárov k miestam, ktoré by sa mali rozvíjať:

```
[
  { Komentar: 'Zastávka Náměstí republiky' },
  { Komentar: 'Pokud "není možná" likvidace a návrat k historickému úrovňovému řešené ulice...'},
  { Komentar: 'Myslím, že už je to v plánu, ale Frýdlanstké mosty jsou v hrozném stavu, přstupní uzel, aktuálně nereprezuntující...' }
]
```

## Databáza časových rád

**Názov**: Dopravní přestupky dle data a místa spáchání v roce 2024<br>
**Odkaz**: https://opendata.ostrava.cz/soubory/DatovyPortal/prestupky/20240101_20240630_dopravniprestupky.csv<br>
**Distribúcia**: CSV<br>
**Druh databázy**: InfluxDB<br>

Vymazanie chybného riadku
`23945,0202-05-16," " ,56/2001,83,1,b),,pokuta`

Prevedenie dát z CSV do influx line protokolu (prečo som nepoužil extended CSV - pretože timestamp
mám iný formát):
    - dátum na timestamp
    - neuvažujeme riešenie pretože veľa dát ho nemá, taktiež číslo priestupku
    - tag = popis miesta + číslo zákona
    - fields = ostatné veci

proces nastavenia influx ():
    spustenie serveru,
