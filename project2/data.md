# Projekt, 2. část: ukládání rozsáhlých dat v NoSQL databázích (zadání, požadavky; Rychlý)

Autoři: Jakub Vlk (xvlkja07), Adam Zvara (xzvara01)

# Databáze neo4j

**Název:** Zastávky MHD v Statutární město Ostrava
**Odkazy:
** https://data.gov.cz/datov%C3%A1-sada?iri=https%3A%2F%2Fdata.gov.cz%2Fzdroj%2Fdatov%C3%A9-sady%2F00845451%2F37085532
<br>**Distribuce:** GeoJSON<br>
**Druh databáze:** neo4j<br>
**Pro uplnost zde uvadím, data tak jak jsem je získla z wikipedie:**

1) Hlavní nádraží – Náměstí Svatopluka Čecha – Muglinovská – Křižíkova – Důl Jindřich – Stodolní – Elektra – Karolina –
   Náměstí Republiky – Don Bosco – Dolní Vítkovice Hlubina – Dolní Vítkovice – Český dům – Důl Jeremenko – Kolonie
   Jeremenko – Moravská – Dřevoprodej – Hrabůvka, kostel – Hrabůvka, Poliklinika – Josefa Kotase – Antonína Poledníka –
   Václava Jiřikovského – Dubina
2) Hlavní nádraží – Náměstí Svatopluka Čecha – Muglinovská – Křižíkova – Důl Jindřich – Stodolní – Elektra – Karolina –
   Náměstí Republiky – Don Bosco – Dolní Vítkovice Hlubina – Dolní Vítkovice – Vítkovice, Mírové náměstí – Stará
   ocelárna – Ředitelství Vítkovic – SPORT ARÉNA – Karpatská – Horymírova – Zábřeh, OC – Zábřeh, vodárna – Kotva – Kino
   Luna – 29. dubna – Nové Výškovice – Výškovice
3) Dubina – Václava Jiřikovského – Antonína Poledníka – Josefa Kotase – Náměstí Ostrava-Jih – ÚMOb Jih – Rodinná –
   Tylova – Dolní – Palkovského – Ředitelství Vítkovic – Stará ocelárna – Vítkovice,Mírové náměstí – Pohraniční –
   Vagonka – Mariánské náměstí – Prostorná – Hulváky – Nová ves,vodárna – Svinov,mosty – Třebovice,OC – Třebovická –
   Telekom. škola – Poruba,vozovna
4) Nová huť již.brána – Nová huť hl.brána – Nová huť učiliště – Vratimovská – Kunčičky,kostel – Osada Míru –
   Teplotechna – Hranečník – Důl Zárubek – U Hradu (x) – Výstaviště – Karolina – Náměstí Republiky – Krajský úřad – Dům
   energetiky – Mariánské náměstí – Prostorná Hulváky – Nová Ves,vodárna – Svinov,mosty – Třebovice OC – Třebovická –
   Sokolovská – Čistírny – Bedřicha Nikodéma – Dílny DP Ostrava – Martinov
5) Budišovice,Zátiší – Horní Lhota – Dolní Lhota,osada – Dolní Lhota – Dolní Lhota,U Obory – Krásné Pole – Vřesina,Nová
   Plzeň – Vřesina – Poruba,koupaliště – Poruba,Vřesinská
6) Mor. Ostrava.Plynárny – Důl Jindřich – Stodolní – Elektra – Karolina – Náměstí Republiky – Don Bosco – Dolní
   Vítkovice – Český dům – Důl Jeremenko – Kolonie Jeremenko – Nádraží Vítkovice – Rodinná – Kpt.Vajdy – Rodimcevova –
   Zábřeh,vodárna – Kotva – Kino Luna – 29. dubna – Nové Výškovice – Výškovice
7) Výškovice – Nové Výškovice – 29. dubna – Kino Luna – Kotva – Zábřeh,vodárna – Zábřeh,OC – Horymírova – Karpatská –
   SPORT ARÉNA – Palkovského – Hulvácká – Ferona – Střelnice – Nová Ves,vodárna – Nová Ves.vodárna – Svinov,mosty –
   Třebovice,OC – Třebovická – Telekom.škola – (Poruba,vozovna) – Rektorát VŠB – Hlavní třída – Fakultní nemocnice –
   Poruba,Vřesinská
8) '(Přívoz,Hlučínská – Důl Odra, Sad B.Němcové)' – Hlavní nádraží – Náměstí S. Čecha – Muglinovská – Křižíkova – (Mor.
   Ostrava,Plynárny) – Důl Jindřich – Stodolní – Elektra – Karolina – Náměstí Republiky – Krajský úřad – Dům
   energetiky – Mariánské náměstí – Prostorná – Hulváky – Nová Ves,vodárna – Svinov,mosty – Třebovice,OC – Třebovická –
   Telekom.škola – Poruba,vozovna – Rektorát VŠB – Hlavní třída – Fakultní nemocnice – Poruba,Vřesinská
10) Hranečník – Výstaviště – Karolina – Náměstí Republiky – Don Bosco – Dolní Vítkovice Hlubina – Dolní Vítkovice – Důl
    Jeremenko – Dřevoprodej – Hrabůvka,kostel – Hrabůvka,Poliklinika – Josefa Kotase – Antonína Poledníka – Václava
    Jiřikovského – Dubina
11) Poruba,vozovna – Telekom. škola – Třebovická – Třebovice,OC – Svinov,mosty – Nová ves,vodárna – Střelnice – Ferona –
    Hulvácká – Palkovského – SPORT ARÉNA – Městský stadion – Most Čs. armády – Nádraží Vítkovice – Rodinná – Kpt.
    Vajdy – Rodimcevova – Zábřeh, vodárna – Kotva – Kino Luna – Svornosti – Zábřeh
12) Hranečník – Důl Zárubek – Výstaviště – Karolina – Náměstí Republiky – Krajský úřad – Dům energetiky – Mariánské
    náměstí – Vagonka – Pohraniční – Vítkovice,Mírové náměstí – Stará ocelárna – Ředitel.Vítkovic – SPORT ARÉNA –
    Městský stadion – Most Čs. armády – Provaznická – Hrabůvka, kostel – Hrabůvka, Poliklinika – Josefa Kotase –
    Antonína Poledníka – Václava Jiřikovského – Dubina
14) Přívoz,Hlučínská – Důl Odra – Sad B.Němcové – Muglinovská – Křižíkova – Důl Jindřich – Stodolní – Elektra –
    Výstaviště – Hranečník – Osada Míru – Vratimovská – Nová huť učiliště – Nová huť hl.brána – Nová huť již.brána
15) Dubina – Václava Jiřikovského – Antonína Poledníka – Josefa Kotase – Náměstí Ostrava-Jih – ÚMOb Jih – Rodinná –
    Kpt.Vajdy – Rodimcevova – Zábřeh vodárna – Kotva – Kino Luna – 29. dubna – Nové Výškovice – Výškovice
16) Výstaviště – Náměstí Republiky – Dům kultury Vítkovic – Dům energetiky – Náměstí K. Marxe – Prostorná – Hulváky
    koupaliště – Nová Ves vodárna – U koupaliště – Bedřiška – Hulvácká – Zábřeh nemocnice – Stadión TJ Vítkovice – Most
    Československé Armády – Nádraží OV. Vítkovice – Horní – Nemocnice NHKG – Rodimcevova – Zábřeh vodárna – Čujkovova –
    Volgogradská – Ul. 29. dubna – Nové Výškovice – Výškovice smyčka
17) (Poruba, Vřesinská) – Fakultní nemocnice – Hlavní třída – VŠB-TUO – Poruba,vozovna – Telekom.škola – Třebovická –
    Třebovice, OC – Svinov,mosty – Nová Ves,vodárna – Nová Ves,vodárna – Střelnice – Ferona – Hulvácká – Dolní –
    Tylova – Rodinná – ÚMOb Jih – Náměstí Ostrava-Jih – Josefa Kotase – Antonína Poledníka – Václava Jiříkovského –
    Dubina
18) Dubina – Václava Jiřikovského – Antonína Poledníka – Josefa Kotase – Náměstí Ostrava-Jih – ÚMOb Jih – Rodinná –
    Tylova – Dolní – Hulvácká – Ferona – Střelnice – Nová Ves,vodárna – Hulváky – Prostorná – Daliborova – Mariánské
    náměstí – Dům energetiky – Krajský úřad – Náměstí Republiky – Karolina – Elektra – Stodolní – Důl Jindřich –
    Křižíkova – Muglinovská – Náměstí S.Čecha – Hlavní nádraží
19) Martinov – Dílny DP Ostrava – Bedřicha Nikodéma – Čistírny – Sokolovská – Třebovická – Třebovice,OC – Svinov,mosty –
    Nová Ves,vodárna – Střelnice – Ferona – Hulvácká – Dolní – Tylova – Rodinná – ÚMOb Jih – Náměstí Ostrava-Jih –
    Josefa Kotase – Antonína Poledníka – Václava Jiřikovského – Dubina

Pro grafové databáze se hodí především takové data nad kterémi chceme provádět grafové algortmiy. V případě našich dat
se jedná o přirozenou reprezetaci vztahů o existenci cest mezi zastávky. Neo4j má sobě implementováno spoustu grafových
algoritmů, které můžeme využít pro analýzu dat. Díky tomu můžeme snadno zjistit například nejkratší cestu mezi dvěma
zastávkami. 

## Vložení a definice schématu

Pochopitelně jsem tento script nenapsali ručně, ale využili jsme nástroj, který nám tento script vygeneroval. Celý
script je možné najít v souboru nakonci. Zde je ukázka toho, jak vypadá vložení zastávek a první linky.

```sql
// Create
all stops
UNWIND [
    '29. dubna',
    'Antonína Poledníka',
    'Bedřicha Nikodéma',
    'Bedřiška',
    'Budišovice,Zátiší',
    'Daliborova',
    'Dolní',
    'Dolní Lhota',
    'Dolní Lhota,U Obory',
    'Dolní Lhota,osada',
    'Dolní Vítkovice',
    'Dolní Vítkovice Hlubina',
    'Don Bosco',
    'Dubina',
    'Dílny DP Ostrava',
    'Dřevoprodej',
    'Důl Jeremenko',
    'Důl Jindřich',
    'Důl Odra',
    'Důl Zárubek',
    'Dům energetiky',
    'Dům kultury Vítkovic',
    'Elektra',
    'Fakultní nemocnice',
    'Ferona',
    'Hlavní nádraží',
    'Hlavní třída',
    'Horní',
    'Horní Lhota',
    'Horymírova',
    'Hrabůvka, Poliklinika',
    'Hrabůvka, kostel',
    'Hrabůvka,Poliklinika',
    'Hrabůvka,kostel',
    'Hranečník',
    'Hulvácká',
    'Hulváky',
    'Hulváky koupaliště',
    'Josefa Kotase',
    'Karolina',
    'Karpatská',
    'Kino Luna',
    'Kolonie Jeremenko',
    'Kotva',
    'Kpt. Vajdy',
    'Kpt.Vajdy',
    'Krajský úřad',
    'Krásné Pole',
    'Kunčičky,kostel',
    'Křižíkova',
    'Mariánské náměstí',
    'Martinov',
    'Mor. Ostrava.Plynárny',
    'Moravská',
    'Most Československé Armády',
    'Most Čs. armády',
    'Muglinovská',
    'Městský stadion',
    'Nemocnice NHKG',
    'Nová Ves vodárna',
    'Nová Ves,vodárna',
    'Nová Ves.vodárna',
    'Nová huť hl.brána',
    'Nová huť již.brána',
    'Nová huť učiliště',
    'Nová ves,vodárna',
    'Nové Výškovice',
    'Nádraží OV. Vítkovice',
    'Nádraží Vítkovice',
    'Náměstí K. Marxe',
    'Náměstí Ostrava-Jih',
    'Náměstí Republiky',
    'Náměstí S. Čecha',
    'Náměstí S.Čecha',
    'Náměstí Svatopluka Čecha',
    'Osada Míru',
    'Palkovského',
    'Pohraniční',
    'Poruba,Vřesinská',
    'Poruba,koupaliště',
    'Poruba,vozovna',
    'Prostorná',
    'Prostorná Hulváky',
    'Provaznická',
    'Přívoz,Hlučínská',
    'Rektorát VŠB',
    'Rodimcevova',
    'Rodinná',
    'SPORT ARÉNA',
    'Sad B.Němcové',
    'Sokolovská',
    'Stadión TJ Vítkovice',
    'Stará ocelárna',
    'Stodolní',
    'Střelnice',
    'Svinov,mosty',
    'Svornosti',
    'Telekom. škola',
    'Telekom.škola',
    'Teplotechna',
    'Tylova',
    'Třebovice OC',
    'Třebovice, OC',
    'Třebovice,OC',
    'Třebovická',
    'U Hradu',
    'U koupaliště',
    'Ul. 29. dubna',
    'Vagonka',
    'Volgogradská',
    'Vratimovská',
    'Václava Jiřikovského',
    'Václava Jiříkovského',
    'Vítkovice, Mírové náměstí',
    'Vítkovice,Mírové náměstí',
    'Výstaviště',
    'Výškovice',
    'Výškovice smyčka',
    'Vřesina',
    'Vřesina,Nová Plzeň',
    'VŠB-TUO',
    'Zábřeh',
    'Zábřeh nemocnice',
    'Zábřeh vodárna',
    'Zábřeh, OC',
    'Zábřeh, vodárna',
    'Zábřeh,OC',
    'Zábřeh,vodárna',
    'ÚMOb Jih',
    'Český dům',
    'Čistírny',
    'Čujkovova',
    'Ředitel.Vítkovic',
    'Ředitelství Vítkovic'
] AS stopName
CREATE
(s:Stop {name: stopName});

// Create
route 1 and its connections
MERGE (l1:Line {number: '1'})
WITH l1
MATCH (s0:Stop {name: 'Hlavní nádraží'})
MATCH (s1:Stop {name: 'Náměstí Svatopluka Čecha'})
CREATE
(s0)-[:NEXT {line: l1.number, order: 1}]->(s1);
WITH l1
    MATCH (s1:Stop {name : 'Náměstí Svatopluka Čecha'})
    MATCH (s2:Stop {name : 'Muglinovská'})
CREATE
(s1)-[:NEXT {line: l1.number, order: 2}]->(s2);
WITH l1
    MATCH (s2:Stop {name : 'Muglinovská'})
    MATCH (s3:Stop {name : 'Křižíkova'})
CREATE
(s2)-[:NEXT {line: l1.number, order: 3}]->(s3);
WITH l1
    MATCH (s3:Stop {name : 'Křižíkova'})
    MATCH (s4:Stop {name : 'Důl Jindřich'})
CREATE
(s3)-[:NEXT {line: l1.number, order: 4}]->(s4);
WITH l1
    MATCH (s4:Stop {name : 'Důl Jindřich'})
    MATCH (s5:Stop {name : 'Stodolní'})
CREATE
(s4)-[:NEXT {line: l1.number, order: 5}]->(s5);
WITH l1
    MATCH (s5:Stop {name : 'Stodolní'})
    MATCH (s6:Stop {name : 'Elektra'})
CREATE
(s5)-[:NEXT {line: l1.number, order: 6}]->(s6);
WITH l1
    MATCH (s6:Stop {name : 'Elektra'})
    MATCH (s7:Stop {name : 'Karolina'})
CREATE
(s6)-[:NEXT {line: l1.number, order: 7}]->(s7);
WITH l1
    MATCH (s7:Stop {name : 'Karolina'})
    MATCH (s8:Stop {name : 'Náměstí Republiky'})
CREATE
(s7)-[:NEXT {line: l1.number, order: 8}]->(s8);
WITH l1
    MATCH (s8:Stop {name : 'Náměstí Republiky'})
    MATCH (s9:Stop {name : 'Don Bosco'})
CREATE
(s8)-[:NEXT {line: l1.number, order: 9}]->(s9);
WITH l1
    MATCH (s9:Stop {name : 'Don Bosco'})
    MATCH (s10:Stop {name : 'Dolní Vítkovice Hlubina'})
CREATE
(s9)-[:NEXT {line: l1.number, order: 10}]->(s10);
WITH l1
    MATCH (s10:Stop {name : 'Dolní Vítkovice Hlubina'})
    MATCH (s11:Stop {name : 'Dolní Vítkovice'})
CREATE
(s10)-[:NEXT {line: l1.number, order: 11}]->(s11);
WITH l1
    MATCH (s11:Stop {name : 'Dolní Vítkovice'})
    MATCH (s12:Stop {name : 'Český dům'})
CREATE
(s11)-[:NEXT {line: l1.number, order: 12}]->(s12);
WITH l1
    MATCH (s12:Stop {name : 'Český dům'})
    MATCH (s13:Stop {name : 'Důl Jeremenko'})
CREATE
(s12)-[:NEXT {line: l1.number, order: 13}]->(s13);
WITH l1
    MATCH (s13:Stop {name : 'Důl Jeremenko'})
    MATCH (s14:Stop {name : 'Kolonie Jeremenko'})
CREATE
(s13)-[:NEXT {line: l1.number, order: 14}]->(s14);
WITH l1
    MATCH (s14:Stop {name : 'Kolonie Jeremenko'})
    MATCH (s15:Stop {name : 'Moravská'})
CREATE
(s14)-[:NEXT {line: l1.number, order: 15}]->(s15);
WITH l1
    MATCH (s15:Stop {name : 'Moravská'})
    MATCH (s16:Stop {name : 'Dřevoprodej'})
CREATE
(s15)-[:NEXT {line: l1.number, order: 16}]->(s16);
WITH l1
    MATCH (s16:Stop {name : 'Dřevoprodej'})
    MATCH (s17:Stop {name : 'Hrabůvka, kostel'})
CREATE
(s16)-[:NEXT {line: l1.number, order: 17}]->(s17);
WITH l1
    MATCH (s17:Stop {name : 'Hrabůvka, kostel'})
    MATCH (s18:Stop {name : 'Hrabůvka, Poliklinika'})
CREATE
(s17)-[:NEXT {line: l1.number, order: 18}]->(s18);
WITH l1
    MATCH (s18:Stop {name : 'Hrabůvka, Poliklinika'})
    MATCH (s19:Stop {name : 'Josefa Kotase'})
CREATE
(s18)-[:NEXT {line: l1.number, order: 19}]->(s19);
WITH l1
    MATCH (s19:Stop {name : 'Josefa Kotase'})
    MATCH (s20:Stop {name : 'Antonína Poledníka'})
CREATE
(s19)-[:NEXT {line: l1.number, order: 20}]->(s20);
WITH l1
    MATCH (s20:Stop {name : 'Antonína Poledníka'})
    MATCH (s21:Stop {name : 'Václava Jiřikovského'})
CREATE
(s20)-[:NEXT {line: l1.number, order: 21}]->(s21);
WITH l1
    MATCH (s21:Stop {name : 'Václava Jiřikovského'})
    MATCH (s22:Stop {name : 'Dubina'})
CREATE
(s21)-[:NEXT {line: l1.number, order: 22}]->(s22);
/**
 * Tímto způsobem jsme vytvořil celou grafovou strukturu.
 */

```

# Sloupcová wide-column databáze

**Název:** Statistika průjezdu vozidel ze sledovaných křižovatek v roce 2024
**Odkazy:** https://opendata.ostrava.cz/soubory/MMOIT/doprava/Statistika-poctu-prujezdu-2024.csv
<br>**Distribuce:** CSV<br>
**Druh databáze:** Cassandra<br>

Data vhodná do wide-column databáze jsou taková, která se nebudou často modifikovat, ale budou často čtena nebo pro
data, která mají velký počet záznamů. Déle je výhodné pokud se data málo nebo vůbec mění a nebo pokud je klíčové
rychlé vkládání hodnot a jejich čtení podle konrétně známého vzorce.

Kličovou vlastností je jednodché a průběžně aktualizovatelné škálování, což zajistí jak maximální výkon tak i redudanci
kterou je možné nastavit pomocí parametru replikace dat. I díky tomu cassandar exceluje při pravidelné přidávání velkého
množství záznamů v porovnání s tradičními relačními databázemi.

Další výhodou sloupcových wide-column databází je možnost jednoduhcého lineráního škálování. Mezi další výhodé patří
distrubovanost, vysoká dostupnost a odolnost proti výpadku v
důsledku distribuce data mezi více uzly.

Další významnou výhodou je škálovatelnost Cassandry. S rostoucím počtem měřících stanic a objemem historických dat
můžeme jednoduše přidávat další nodes do clusteru. Partition key založený na časovém razítku zajišťuje rovnoměrnou
distribuci dat napříč clustery, což je kritické pro dlouhodobou udržitelnost systému. MongoDB nebo Redis by v tomto
ohledu mohly představovat problém - MongoDB kvůli složitějšímu škálování zápisů, Redis kvůli své primárně in-memory
povaze, která by byla pro historická data nákladná.

Databáze casandra nabízí i TTL (Time to live) mechanismus, což umožnuje automatickou expiraci data a jejich a
agregaci pro zachování informace, ale šetření místa.

Zvolený dataset obsahuje přes 22 tisíc záznamů. Dá se přepokládat že tyto data se prakticky nebudou měnit.Data budou
kontiuálně růst (append only). Data obsahují informace indexované datumem a časem což je taktéř vhodné pro tyto typy
databází. Data taktéž musí mít pevnou strukturu a neobsahují prázdné hodnoty. Data neobsahují žádné relační vztahy. Tato
data jsou vhodná pro sloupcové databáze.Předpokládá se hledání podle data a stanice, což je vhodné pro sloupcové
databáze.

Způsob dotazování těchto dat také hraje významnou roli v rozhodnutí pro Cassandru. Většina dotazů bude směřovat na
konkrétní časové období nebo konkrétní měřící stanici v daném čase. Cassandra tento pattern podporuje prostřednictvím
své partition key (v našem případě datum) a clustering key (stanice). Díky tomu jsou dotazy na konkrétní časový úsek
extrémně efektivní, protože Cassandra přesně ví, kde data najít, bez nutnosti procházet celou databázi.

__Data jsou struktoruováná následovně:__

- Časové razítko (datum): Primární identifikátor měření
- Lokace (stanice): Textový identifikátor místa měření
- Typ vozidla (trida_objektu): Kategorické rozlišení (Velké/Ostatní)
- Počet průjezdů (pocet): Numerická hodnota

Pro konkrétní případ našich dat je také významné, že Cassandra umožňuje efektivní implementaci materialized views (je
potřeba povolit v konfiguraci databáze).
Čímž se dá do značné míry vyřeit nevýhoda sloupcových databází, kdy pokud je vytvořen složitější dotaz tak je potřeba
přidat za dotaz `ALLOW FILTERING` což znamená že dotaz bude neefektivní a bude se procháze všechna data a pro každý
řádek bude zkontrolována podmínka. Materialized views umožňují si tyto dotazy předpočítat a ukládat do databáze.

## Vložení dat a definice schématu

Tato datové sada jsou distrubuovaný poouze jako CSV. Pro vložení dat do databáze je třeba pouze vytvořit name space,
definovat tabulku a data vložit přímo funkcí `COPY` v `cqslh` lze vkládat z csv souboru. Není potřeba
algoritmicky nic provádět.


[//]: <> (@formatter:off)

```sql
CREATE KEYSPACE IF NOT EXISTS traffic_monitoring 
WITH replication = {
    'class': 'SimpleStrategy',
    'replication_factor': 1
};

USE traffic_monitoring;

-- Hlavní tabulka s jednoduchovou strukturou
CREATE TABLE IF NOT EXISTS traffic_measurements (
    datum timestamp,
    stanice text,
    trida_objektu text,
    pocet int,
    PRIMARY KEY ((stanice), datum)
) WITH CLUSTERING ORDER BY (datum DESC);

-- Import dat
COPY traffic_measurements (datum, stanice, trida_objektu, pocet)
FROM '/shared_data/Statistika-poctu-prujezdu-2024.csv'
WITH HEADER = TRUE
AND DELIMITER = ','
AND DATETIMEFORMAT = '%d.%m.%Y %H:%M';
  
```
    
[//]: <> (@formatter:on)

**Output:**

```text
Starting copy of traffic_monitoring.traffic_measurements with columns [datum, stanice, trida_objektu, pocet].
Processed: 22386 rows; Rate:   17053 rows/s; Avg. rate:   31068 rows/s
22386 rows imported from 1 files in 0.721 seconds (0 skipped).
```

### Ukázka dotazu

Hlavní výhoda této databáze je možnost jednoduchého přidávání uzlů do klastru (Horizontální škálování). S tímto souvisí
vysoká dostupnosta odlnost proti výpatku. Vzheldem k tomu, že jsme testovali pouze na datábázi s jedním uzlem, tak
není možné demostrovat funkce kolem redudance a distribuce zátěže což se hodí pro vysoké zátěže.

Dotaz pro získání všech měření na konkrétní stanici ve vybraných dvou dnech uskutečněných na křižovatce `Českobratrská x
Sokolská třída - od konzervatoře`

```sql
SELECT *
FROM traffic_measurements
where stanice = 'Českobratrská x Sokolská třída - od konzervatoře'
  AND datum >= '2024-01-03'
  AND datum < '2024-01-05';
```

```text

 stanice                                          | datum                           | pocet | trida_objektu
--------------------------------------------------+---------------------------------+-------+---------------
 Českobratrská x Sokolská třída - od konzervatoře | 2024-01-04 21:00:00.000000+0000 |     1 |       Ostatní
 Českobratrská x Sokolská třída - od konzervatoře | 2024-01-04 19:00:00.000000+0000 |     1 |       Ostatní
 Českobratrská x Sokolská třída - od konzervatoře | 2024-01-04 18:00:00.000000+0000 |     2 |       Ostatní
 Českobratrská x Sokolská třída - od konzervatoře | 2024-01-04 17:00:00.000000+0000 |     4 |       Ostatní
 Českobratrská x Sokolská třída - od konzervatoře | 2024-01-04 16:00:00.000000+0000 |    10 |       Ostatní
 Českobratrská x Sokolská třída - od konzervatoře | 2024-01-04 15:00:00.000000+0000 |    70 |         Velké
 Českobratrská x Sokolská třída - od konzervatoře | 2024-01-04 14:00:00.000000+0000 |    56 |         Velké
 Českobratrská x Sokolská třída - od konzervatoře | 2024-01-04 13:00:00.000000+0000 |    84 |         Velké
 Českobratrská x Sokolská třída - od konzervatoře | 2024-01-04 12:00:00.000000+0000 |   123 |         Velké
 Českobratrská x Sokolská třída - od konzervatoře | 2024-01-04 11:00:00.000000+0000 |    20 |         Velké
 Českobratrská x Sokolská třída - od konzervatoře | 2024-01-04 10:00:00.000000+0000 |    40 |         Velké
 Českobratrská x Sokolská třída - od konzervatoře | 2024-01-04 09:00:00.000000+0000 |    35 |         Velké
 Českobratrská x Sokolská třída - od konzervatoře | 2024-01-04 08:00:00.000000+0000 |    28 |         Velké
 Českobratrská x Sokolská třída - od konzervatoře | 2024-01-04 07:00:00.000000+0000 |     8 |         Velké
 Českobratrská x Sokolská třída - od konzervatoře | 2024-01-04 06:00:00.000000+0000 |     4 |       Ostatní
 Českobratrská x Sokolská třída - od konzervatoře | 2024-01-04 05:00:00.000000+0000 |     2 |         Velké
 Českobratrská x Sokolská třída - od konzervatoře | 2024-01-03 22:00:00.000000+0000 |     1 |       Ostatní
 Českobratrská x Sokolská třída - od konzervatoře | 2024-01-03 21:00:00.000000+0000 |     3 |         Velké
 Českobratrská x Sokolská třída - od konzervatoře | 2024-01-03 20:00:00.000000+0000 |     1 |         Velké
 Českobratrská x Sokolská třída - od konzervatoře | 2024-01-03 19:00:00.000000+0000 |     2 |         Velké
 Českobratrská x Sokolská třída - od konzervatoře | 2024-01-03 18:00:00.000000+0000 |     7 |       Ostatní
 Českobratrská x Sokolská třída - od konzervatoře | 2024-01-03 17:00:00.000000+0000 |     7 |       Ostatní
 Českobratrská x Sokolská třída - od konzervatoře | 2024-01-03 16:00:00.000000+0000 |    10 |         Velké
 Českobratrská x Sokolská třída - od konzervatoře | 2024-01-03 15:00:00.000000+0000 |    28 |         Velké

(24 rows)

```

## Testování:

Jen pro uplnost zde uvadím, že jsem testovali na jednom uzlu, v docker instanci. Příkladám docker-compose který jsme
použili.

```yml
version: '3'

services:
  cassandra:
    image: cassandra:latest
    container_name: cassandra-container
    ports:
      - "9042:9042"
    environment:
      - CASSANDRA_USER=admin
      - CASSANDRA_PASSWORD=admin
    volumes:
      - cassandra-data:/var/lib/cassandra
      - .:/shared_data

volumes:
  cassandra-data:

```


