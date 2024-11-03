/*you havent visited these stops:  set()
*/
CREATE CONSTRAINT stop_name IF NOT EXISTS FOR (s:Stop) REQUIRE s.name IS UNIQUE;

UNWIND [
 {name: 'Hlavní nádraží',location: point({longitude: 18.268441009548248, latitude: 18.268441009548248}), wheelchair_accessible: False},
{name: 'Náměstí S.Čecha',location: point({longitude: 18.272677009208753, latitude: 18.272677009208753}), wheelchair_accessible: False},
{name: 'Muglinovská',location: point({longitude: 18.278012008641852, latitude: 18.278012008641852}), wheelchair_accessible: True},
{name: 'Křižíkova',location: point({longitude: 18.28043000878951, latitude: 18.28043000878951}), wheelchair_accessible: True},
{name: 'Důl Jindřich',location: point({longitude: 18.283721008432263, latitude: 18.283721008432263}), wheelchair_accessible: True},
{name: 'Stodolní',location: point({longitude: 18.28573800822088, latitude: 18.28573800822088}), wheelchair_accessible: True},
{name: 'Elektra',location: point({longitude: 18.287953008905006, latitude: 18.287953008905006}), wheelchair_accessible: True},
{name: 'Náměstí Republiky',location: point({longitude: 18.279876009278233, latitude: 18.279876009278233}), wheelchair_accessible: True},
{name: 'Don Bosco',location: point({longitude: 18.27855900925202, latitude: 18.27855900925202}), wheelchair_accessible: False},
{name: 'Dolní Vítkovice Hlubina',location: point({longitude: 18.277265008919592, latitude: 18.277265008919592}), wheelchair_accessible: True},
{name: 'Dolní Vítkovice',location: point({longitude: 18.275523009302308, latitude: 18.275523009302308}), wheelchair_accessible: True},
{name: 'Vítkovice,Mírové nám.',location: point({longitude: 18.264781008619945, latitude: 18.264781008619945}), wheelchair_accessible: True},
{name: 'Stará ocelárna',location: point({longitude: 18.25856500917161, latitude: 18.25856500917161}), wheelchair_accessible: False},
{name: 'Ředitelství Vítkovic',location: point({longitude: 18.252643009112756, latitude: 18.252643009112756}), wheelchair_accessible: True},
{name: 'Městský stadion',location: point({longitude: 18.255403008872563, latitude: 18.255403008872563}), wheelchair_accessible: True},
{name: 'Most Čs. armády',location: point({longitude: 18.260610008384475, latitude: 18.260610008384475}), wheelchair_accessible: True},
{name: 'Nádraží Vítkovice',location: point({longitude: 18.26200800883006, latitude: 18.26200800883006}), wheelchair_accessible: True},
{name: 'Rodinná',location: point({longitude: 18.249603008688045, latitude: 18.249603008688045}), wheelchair_accessible: True},
{name: 'Kpt.Vajdy',location: point({longitude: 18.244684009051017, latitude: 18.244684009051017}), wheelchair_accessible: True},
{name: 'Rodimcevova',location: point({longitude: 18.238119009074996, latitude: 18.238119009074996}), wheelchair_accessible: False},
{name: 'Zábřeh,vodárna',location: point({longitude: 18.231988009321142, latitude: 18.231988009321142}), wheelchair_accessible: True},
{name: 'Kotva',location: point({longitude: 18.228602008565897, latitude: 18.228602008565897}), wheelchair_accessible: True},
{name: 'Kino Luna',location: point({longitude: 18.2258140094227, latitude: 18.2258140094227}), wheelchair_accessible: True},
{name: '29.dubna',location: point({longitude: 18.22324100846667, latitude: 18.22324100846667}), wheelchair_accessible: True},
{name: 'Nové Výškovice',location: point({longitude: 18.22280900878865, latitude: 18.22280900878865}), wheelchair_accessible: True},
{name: 'Výškovice',location: point({longitude: 18.22288000876945, latitude: 18.22288000876945}), wheelchair_accessible: True},
{name: 'Poruba,Vřesinská',location: point({longitude: 18.158685008538875, latitude: 18.158685008538875}), wheelchair_accessible: True},
{name: 'Fakultní nemocnice',location: point({longitude: 18.161536008204763, latitude: 18.161536008204763}), wheelchair_accessible: True},
{name: 'Hlavní třída',location: point({longitude: 18.16432400919036, latitude: 18.16432400919036}), wheelchair_accessible: True},
{name: 'Rektorát VŠB',location: point({longitude: 18.1660090088263, latitude: 18.1660090088263}), wheelchair_accessible: True},
{name: 'Poruba,vozovna',location: point({longitude: 18.17638600849342, latitude: 18.17638600849342}), wheelchair_accessible: True},
{name: 'Telekom.škola',location: point({longitude: 18.185726009359485, latitude: 18.185726009359485}), wheelchair_accessible: True},
{name: 'Třebovická',location: point({longitude: 18.193001008814488, latitude: 18.193001008814488}), wheelchair_accessible: True},
{name: 'Svinov,mosty',location: point({longitude: 18.209346009469474, latitude: 18.209346009469474}), wheelchair_accessible: True},
{name: 'Nová Ves,vodárna',location: point({longitude: 18.232955008917113, latitude: 18.232955008917113}), wheelchair_accessible: True},
{name: 'Hulváky',location: point({longitude: 18.24397600820836, latitude: 18.24397600820836}), wheelchair_accessible: False},
{name: 'Prostorná',location: point({longitude: 18.249927008319283, latitude: 18.249927008319283}), wheelchair_accessible: True},
{name: 'Mariánské náměstí',location: point({longitude: 18.256177009408514, latitude: 18.256177009408514}), wheelchair_accessible: True},
{name: 'Pohraniční',location: point({longitude: 18.263911008456486, latitude: 18.263911008456486}), wheelchair_accessible: False},
{name: 'Martinov',location: point({longitude: 18.18304400841346, latitude: 18.18304400841346}), wheelchair_accessible: True},
{name: 'Dílny DP Ostrava',location: point({longitude: 18.18223600890854, latitude: 18.18223600890854}), wheelchair_accessible: False},
{name: 'Bedřicha Nikodéma',location: point({longitude: 18.182719008405076, latitude: 18.182719008405076}), wheelchair_accessible: True},
{name: 'Čistírny',location: point({longitude: 18.187293008976347, latitude: 18.187293008976347}), wheelchair_accessible: True},
{name: 'Sokolovská',location: point({longitude: 18.188352009414935, latitude: 18.188352009414935}), wheelchair_accessible: True},
{name: 'Dům energetiky',location: point({longitude: 18.265131008629385, latitude: 18.265131008629385}), wheelchair_accessible: True},
{name: 'Krajský úřad',location: point({longitude: 18.272191008511136, latitude: 18.272191008511136}), wheelchair_accessible: True},
{name: 'Sad B.Němcové',location: point({longitude: 18.277049009148733, latitude: 18.277049009148733}), wheelchair_accessible: True},
{name: 'Důl Odra',location: point({longitude: 18.27230400894877, latitude: 18.27230400894877}), wheelchair_accessible: False},
{name: 'Přívoz,Hlučínská',location: point({longitude: 18.264929008307018, latitude: 18.264929008307018}), wheelchair_accessible: False},
{name: 'Poruba,koupaliště',location: point({longitude: 18.14601100871179, latitude: 18.14601100871179}), wheelchair_accessible: True},
{name: 'Vřesina',location: point({longitude: 18.129012008343658, latitude: 18.129012008343658}), wheelchair_accessible: True},
{name: 'Vřesina,Nová Plzeň',location: point({longitude: 18.1240620082459, latitude: 18.1240620082459}), wheelchair_accessible: True},
{name: 'Krásné Pole',location: point({longitude: 18.113264008311166, latitude: 18.113264008311166}), wheelchair_accessible: True},
{name: 'Dolní Lhota,U Obory',location: point({longitude: 18.095077008412314, latitude: 18.095077008412314}), wheelchair_accessible: False},
{name: 'Dolní Lhota',location: point({longitude: 18.087917008126066, latitude: 18.087917008126066}), wheelchair_accessible: True},
{name: 'Horní Lhota',location: point({longitude: 18.061300008760632, latitude: 18.061300008760632}), wheelchair_accessible: True},
{name: 'Budišovice,Zátiší',location: point({longitude: 18.051314008542974, latitude: 18.051314008542974}), wheelchair_accessible: True},
{name: 'Střelnice',location: point({longitude: 18.23645500850084, latitude: 18.23645500850084}), wheelchair_accessible: False},
{name: 'Ferona',location: point({longitude: 18.239711009310213, latitude: 18.239711009310213}), wheelchair_accessible: False},
{name: 'Hulvácká',location: point({longitude: 18.243346008904197, latitude: 18.243346008904197}), wheelchair_accessible: True},
{name: 'Palkovského',location: point({longitude: 18.247488008162268, latitude: 18.247488008162268}), wheelchair_accessible: True},
{name: 'Výstaviště',location: point({longitude: 18.2910110088704, latitude: 18.2910110088704}), wheelchair_accessible: True},
{name: 'Důl Zárubek',location: point({longitude: 18.301376009296266, latitude: 18.301376009296266}), wheelchair_accessible: False},
{name: 'Hranečník',location: point({longitude: 18.31804100822252, latitude: 18.31804100822252}), wheelchair_accessible: True},
{name: 'Teplotechna',location: point({longitude: 18.31488900879798, latitude: 18.31488900879798}), wheelchair_accessible: True},
{name: 'Osada Míru',location: point({longitude: 18.305463009420844, latitude: 18.305463009420844}), wheelchair_accessible: False},
{name: 'Vratimovská',location: point({longitude: 18.30430600832738, latitude: 18.30430600832738}), wheelchair_accessible: False},
{name: 'Nová huť učiliště',location: point({longitude: 18.304083009426314, latitude: 18.304083009426314}), wheelchair_accessible: False},
{name: 'Nová huť hl.brána',location: point({longitude: 18.303176008322453, latitude: 18.303176008322453}), wheelchair_accessible: True},
{name: 'Nová huť již.brána',location: point({longitude: 18.299207008907025, latitude: 18.299207008907025}), wheelchair_accessible: False},
{name: 'Svornosti',location: point({longitude: 18.229953009059027, latitude: 18.229953009059027}), wheelchair_accessible: False},
{name: 'Zábřeh',location: point({longitude: 18.235323008766322, latitude: 18.235323008766322}), wheelchair_accessible: True},
{name: 'Josefa Kotase',location: point({longitude: 18.255552008666555, latitude: 18.255552008666555}), wheelchair_accessible: True},
{name: 'Provaznická',location: point({longitude: 18.271057009614502, latitude: 18.271057009614502}), wheelchair_accessible: True},
{name: 'Hrabůvka,kostel',location: point({longitude: 18.266605009544357, latitude: 18.266605009544357}), wheelchair_accessible: True},
{name: 'Hrabůvka,Poliklinika',location: point({longitude: 18.259707008744854, latitude: 18.259707008744854}), wheelchair_accessible: True},
{name: 'Dolní',location: point({longitude: 18.244691009147356, latitude: 18.244691009147356}), wheelchair_accessible: False},
{name: 'Tylova',location: point({longitude: 18.24655900899481, latitude: 18.24655900899481}), wheelchair_accessible: False},
{name: 'Dřevoprodej',location: point({longitude: 18.27139800930354, latitude: 18.27139800930354}), wheelchair_accessible: True},
{name: 'Karolina',location: point({longitude: 18.28682200824095, latitude: 18.28682200824095}), wheelchair_accessible: True},
{name: 'Český dům',location: point({longitude: 18.2746580087393, latitude: 18.2746580087393}), wheelchair_accessible: True},
{name: 'Důl Jeremenko',location: point({longitude: 18.27489500952647, latitude: 18.27489500952647}), wheelchair_accessible: True},
{name: 'Kolonie Jeremenko',location: point({longitude: 18.27173500931826, latitude: 18.27173500931826}), wheelchair_accessible: True},
{name: 'Moravská',location: point({longitude: 18.271047008331514, latitude: 18.271047008331514}), wheelchair_accessible: True},
{name: 'SPORT ARÉNA',location: point({longitude: 18.250883009041218, latitude: 18.250883009041218}), wheelchair_accessible: True},
{name: 'Mor. Ostrava,Plynárny',location: point({longitude: 18.278705008273526, latitude: 18.278705008273526}), wheelchair_accessible: True},
{name: 'Horymírova',location: point({longitude: 18.23652600944275, latitude: 18.23652600944275}), wheelchair_accessible: True},
{name: 'Zábřeh,OC',location: point({longitude: 18.23301000922255, latitude: 18.23301000922255}), wheelchair_accessible: True},
{name: 'ÚMOb Jih',location: point({longitude: 18.25042400853612, latitude: 18.25042400853612}), wheelchair_accessible: True},
{name: 'Třebovice,Tesco',location: point({longitude: 18.19990000851878, latitude: 18.19990000851878}), wheelchair_accessible: False},
{name: 'Třebovice,OC',location: point({longitude: 18.198506008836475, latitude: 18.198506008836475}), wheelchair_accessible: True},
{name: 'Dolní Lhota,osada',location: point({longitude: 18.079314008205653, latitude: 18.079314008205653}), wheelchair_accessible: False},
{name: 'Antonína Poledníka',location: point({longitude: 18.252055008709597, latitude: 18.252055008709597}), wheelchair_accessible: True},
{name: 'Václava Jiřikovského',location: point({longitude: 18.247837009275795, latitude: 18.247837009275795}), wheelchair_accessible: True},
{name: 'Karpatská',location: point({longitude: 18.24169300839657, latitude: 18.24169300839657}), wheelchair_accessible: True},
{name: 'Dubina',location: point({longitude: 18.245669009323052, latitude: 18.245669009323052}), wheelchair_accessible: True},
{name: 'U Hradu',location: point({longitude: 18.296669009450927, latitude: 18.296669009450927}), wheelchair_accessible: True},
{name: 'Daliborova',location: point({longitude: 18.254088009084025, latitude: 18.254088009084025}), wheelchair_accessible: False},
{name: 'Kunčičky,kostel',location: point({longitude: 18.30481100852727, latitude: 18.30481100852727}), wheelchair_accessible: False}
] AS stop

        CREATE (s:Stop {
            name: stop.name,
            location: point({longitude: stop.longitude, latitude: stop.latitude}),
            wheelchair_accessible: stop.wheelchair_accessible
                }
                )
            WITH s
            RETURN count(*);
            
        

// Create connections for route 1
MATCH (s0:Stop {name: 'Hlavní nádraží'})
MATCH (s1:Stop {name: 'Náměstí S.Čecha'})
MATCH (s2:Stop {name: 'Muglinovská'})
MATCH (s3:Stop {name: 'Křižíkova'})
MATCH (s4:Stop {name: 'Důl Jindřich'})
MATCH (s5:Stop {name: 'Stodolní'})
MATCH (s6:Stop {name: 'Elektra'})
MATCH (s7:Stop {name: 'Karolina'})
MATCH (s8:Stop {name: 'Náměstí Republiky'})
MATCH (s9:Stop {name: 'Don Bosco'})
MATCH (s10:Stop {name: 'Dolní Vítkovice Hlubina'})
MATCH (s11:Stop {name: 'Dolní Vítkovice'})
MATCH (s12:Stop {name: 'Český dům'})
MATCH (s13:Stop {name: 'Důl Jeremenko'})
MATCH (s14:Stop {name: 'Kolonie Jeremenko'})
MATCH (s15:Stop {name: 'Moravská'})
MATCH (s16:Stop {name: 'Dřevoprodej'})
MATCH (s17:Stop {name: 'Hrabůvka,kostel'})
MATCH (s18:Stop {name: 'Hrabůvka,Poliklinika'})
MATCH (s19:Stop {name: 'Josefa Kotase'})
MATCH (s20:Stop {name: 'Antonína Poledníka'})
MATCH (s21:Stop {name: 'Václava Jiřikovského'})
MATCH (s22:Stop {name: 'Dubina'})
CREATE (s0)-[:ROUTE]->(s1),
(s1)-[:ROUTE]->(s0),
(s1)-[:ROUTE]->(s2),
(s2)-[:ROUTE]->(s1),
(s2)-[:ROUTE]->(s3),
(s3)-[:ROUTE]->(s2),
(s3)-[:ROUTE]->(s4),
(s4)-[:ROUTE]->(s3),
(s4)-[:ROUTE]->(s5),
(s5)-[:ROUTE]->(s4),
(s5)-[:ROUTE]->(s6),
(s6)-[:ROUTE]->(s5),
(s6)-[:ROUTE]->(s7),
(s7)-[:ROUTE]->(s6),
(s7)-[:ROUTE]->(s8),
(s8)-[:ROUTE]->(s7),
(s8)-[:ROUTE]->(s9),
(s9)-[:ROUTE]->(s8),
(s9)-[:ROUTE]->(s10),
(s10)-[:ROUTE]->(s9),
(s10)-[:ROUTE]->(s11),
(s11)-[:ROUTE]->(s10),
(s11)-[:ROUTE]->(s12),
(s12)-[:ROUTE]->(s11),
(s12)-[:ROUTE]->(s13),
(s13)-[:ROUTE]->(s12),
(s13)-[:ROUTE]->(s14),
(s14)-[:ROUTE]->(s13),
(s14)-[:ROUTE]->(s15),
(s15)-[:ROUTE]->(s14),
(s15)-[:ROUTE]->(s16),
(s16)-[:ROUTE]->(s15),
(s16)-[:ROUTE]->(s17),
(s17)-[:ROUTE]->(s16),
(s17)-[:ROUTE]->(s18),
(s18)-[:ROUTE]->(s17),
(s18)-[:ROUTE]->(s19),
(s19)-[:ROUTE]->(s18),
(s19)-[:ROUTE]->(s20),
(s20)-[:ROUTE]->(s19),
(s20)-[:ROUTE]->(s21),
(s21)-[:ROUTE]->(s20),
(s21)-[:ROUTE]->(s22),
(s22)-[:ROUTE]->(s21);

// Create connections for route 2
MATCH (s0:Stop {name: 'Hlavní nádraží'})
MATCH (s1:Stop {name: 'Náměstí S.Čecha'})
MATCH (s2:Stop {name: 'Muglinovská'})
MATCH (s3:Stop {name: 'Křižíkova'})
MATCH (s4:Stop {name: 'Důl Jindřich'})
MATCH (s5:Stop {name: 'Stodolní'})
MATCH (s6:Stop {name: 'Elektra'})
MATCH (s7:Stop {name: 'Karolina'})
MATCH (s8:Stop {name: 'Náměstí Republiky'})
MATCH (s9:Stop {name: 'Don Bosco'})
MATCH (s10:Stop {name: 'Dolní Vítkovice Hlubina'})
MATCH (s11:Stop {name: 'Dolní Vítkovice'})
MATCH (s12:Stop {name: 'Stará ocelárna'})
MATCH (s13:Stop {name: 'Ředitelství Vítkovic'})
MATCH (s14:Stop {name: 'SPORT ARÉNA'})
MATCH (s15:Stop {name: 'Karpatská'})
MATCH (s16:Stop {name: 'Horymírova'})
MATCH (s17:Stop {name: 'Zábřeh,OC'})
MATCH (s18:Stop {name: 'Zábřeh,vodárna'})
MATCH (s19:Stop {name: 'Kotva'})
MATCH (s20:Stop {name: 'Kino Luna'})
MATCH (s21:Stop {name: '29.dubna'})
MATCH (s22:Stop {name: 'Nové Výškovice'})
MATCH (s23:Stop {name: 'Výškovice'})
CREATE (s0)-[:ROUTE]->(s1),
(s1)-[:ROUTE]->(s0),
(s1)-[:ROUTE]->(s2),
(s2)-[:ROUTE]->(s1),
(s2)-[:ROUTE]->(s3),
(s3)-[:ROUTE]->(s2),
(s3)-[:ROUTE]->(s4),
(s4)-[:ROUTE]->(s3),
(s4)-[:ROUTE]->(s5),
(s5)-[:ROUTE]->(s4),
(s5)-[:ROUTE]->(s6),
(s6)-[:ROUTE]->(s5),
(s6)-[:ROUTE]->(s7),
(s7)-[:ROUTE]->(s6),
(s7)-[:ROUTE]->(s8),
(s8)-[:ROUTE]->(s7),
(s8)-[:ROUTE]->(s9),
(s9)-[:ROUTE]->(s8),
(s9)-[:ROUTE]->(s10),
(s10)-[:ROUTE]->(s9),
(s10)-[:ROUTE]->(s11),
(s11)-[:ROUTE]->(s10),
(s11)-[:ROUTE]->(s12),
(s12)-[:ROUTE]->(s11),
(s12)-[:ROUTE]->(s13),
(s13)-[:ROUTE]->(s12),
(s13)-[:ROUTE]->(s14),
(s14)-[:ROUTE]->(s13),
(s14)-[:ROUTE]->(s15),
(s15)-[:ROUTE]->(s14),
(s15)-[:ROUTE]->(s16),
(s16)-[:ROUTE]->(s15),
(s16)-[:ROUTE]->(s17),
(s17)-[:ROUTE]->(s16),
(s17)-[:ROUTE]->(s18),
(s18)-[:ROUTE]->(s17),
(s18)-[:ROUTE]->(s19),
(s19)-[:ROUTE]->(s18),
(s19)-[:ROUTE]->(s20),
(s20)-[:ROUTE]->(s19),
(s20)-[:ROUTE]->(s21),
(s21)-[:ROUTE]->(s20),
(s21)-[:ROUTE]->(s22),
(s22)-[:ROUTE]->(s21),
(s22)-[:ROUTE]->(s23),
(s23)-[:ROUTE]->(s22);

// Create connections for route 3
MATCH (s0:Stop {name: 'Dubina'})
MATCH (s1:Stop {name: 'Václava Jiřikovského'})
MATCH (s2:Stop {name: 'Antonína Poledníka'})
MATCH (s3:Stop {name: 'Josefa Kotase'})
MATCH (s4:Stop {name: 'ÚMOb Jih'})
MATCH (s5:Stop {name: 'Rodinná'})
MATCH (s6:Stop {name: 'Tylova'})
MATCH (s7:Stop {name: 'Dolní'})
MATCH (s8:Stop {name: 'Palkovského'})
MATCH (s9:Stop {name: 'Ředitelství Vítkovic'})
MATCH (s10:Stop {name: 'Stará ocelárna'})
MATCH (s11:Stop {name: 'Vítkovice,Mírové nám.'})
MATCH (s12:Stop {name: 'Pohraniční'})
MATCH (s13:Stop {name: 'Mariánské náměstí'})
MATCH (s14:Stop {name: 'Prostorná'})
MATCH (s15:Stop {name: 'Hulváky'})
MATCH (s16:Stop {name: 'Nová Ves,vodárna'})
MATCH (s17:Stop {name: 'Svinov,mosty'})
MATCH (s18:Stop {name: 'Třebovice,OC'})
MATCH (s19:Stop {name: 'Třebovická'})
MATCH (s20:Stop {name: 'Telekom.škola'})
MATCH (s21:Stop {name: 'Poruba,vozovna'})
CREATE (s0)-[:ROUTE]->(s1),
(s1)-[:ROUTE]->(s0),
(s1)-[:ROUTE]->(s2),
(s2)-[:ROUTE]->(s1),
(s2)-[:ROUTE]->(s3),
(s3)-[:ROUTE]->(s2),
(s3)-[:ROUTE]->(s4),
(s4)-[:ROUTE]->(s3),
(s4)-[:ROUTE]->(s5),
(s5)-[:ROUTE]->(s4),
(s5)-[:ROUTE]->(s6),
(s6)-[:ROUTE]->(s5),
(s6)-[:ROUTE]->(s7),
(s7)-[:ROUTE]->(s6),
(s7)-[:ROUTE]->(s8),
(s8)-[:ROUTE]->(s7),
(s8)-[:ROUTE]->(s9),
(s9)-[:ROUTE]->(s8),
(s9)-[:ROUTE]->(s10),
(s10)-[:ROUTE]->(s9),
(s10)-[:ROUTE]->(s11),
(s11)-[:ROUTE]->(s10),
(s11)-[:ROUTE]->(s12),
(s12)-[:ROUTE]->(s11),
(s12)-[:ROUTE]->(s13),
(s13)-[:ROUTE]->(s12),
(s13)-[:ROUTE]->(s14),
(s14)-[:ROUTE]->(s13),
(s14)-[:ROUTE]->(s15),
(s15)-[:ROUTE]->(s14),
(s15)-[:ROUTE]->(s16),
(s16)-[:ROUTE]->(s15),
(s16)-[:ROUTE]->(s17),
(s17)-[:ROUTE]->(s16),
(s17)-[:ROUTE]->(s18),
(s18)-[:ROUTE]->(s17),
(s18)-[:ROUTE]->(s19),
(s19)-[:ROUTE]->(s18),
(s19)-[:ROUTE]->(s20),
(s20)-[:ROUTE]->(s19),
(s20)-[:ROUTE]->(s21),
(s21)-[:ROUTE]->(s20);

// Create connections for route 4
MATCH (s0:Stop {name: 'Nová huť již.brána'})
MATCH (s1:Stop {name: 'Nová huť hl.brána'})
MATCH (s2:Stop {name: 'Nová huť učiliště'})
MATCH (s3:Stop {name: 'Vratimovská'})
MATCH (s4:Stop {name: 'Kunčičky,kostel'})
MATCH (s5:Stop {name: 'Osada Míru'})
MATCH (s6:Stop {name: 'Teplotechna'})
MATCH (s7:Stop {name: 'Hranečník'})
MATCH (s8:Stop {name: 'Důl Zárubek'})
MATCH (s9:Stop {name: 'U Hradu'})
MATCH (s10:Stop {name: 'Výstaviště'})
MATCH (s11:Stop {name: 'Karolina'})
MATCH (s12:Stop {name: 'Náměstí Republiky'})
MATCH (s13:Stop {name: 'Krajský úřad'})
MATCH (s14:Stop {name: 'Dům energetiky'})
MATCH (s15:Stop {name: 'Mariánské náměstí'})
MATCH (s16:Stop {name: 'Nová Ves,vodárna'})
MATCH (s17:Stop {name: 'Svinov,mosty'})
MATCH (s18:Stop {name: 'Třebovice,Tesco'})
MATCH (s19:Stop {name: 'Třebovická'})
MATCH (s20:Stop {name: 'Sokolovská'})
MATCH (s21:Stop {name: 'Čistírny'})
MATCH (s22:Stop {name: 'Bedřicha Nikodéma'})
MATCH (s23:Stop {name: 'Dílny DP Ostrava'})
MATCH (s24:Stop {name: 'Martinov'})
CREATE (s0)-[:ROUTE]->(s1),
(s1)-[:ROUTE]->(s0),
(s1)-[:ROUTE]->(s2),
(s2)-[:ROUTE]->(s1),
(s2)-[:ROUTE]->(s3),
(s3)-[:ROUTE]->(s2),
(s3)-[:ROUTE]->(s4),
(s4)-[:ROUTE]->(s3),
(s4)-[:ROUTE]->(s5),
(s5)-[:ROUTE]->(s4),
(s5)-[:ROUTE]->(s6),
(s6)-[:ROUTE]->(s5),
(s6)-[:ROUTE]->(s7),
(s7)-[:ROUTE]->(s6),
(s7)-[:ROUTE]->(s8),
(s8)-[:ROUTE]->(s7),
(s8)-[:ROUTE]->(s9),
(s9)-[:ROUTE]->(s8),
(s9)-[:ROUTE]->(s10),
(s10)-[:ROUTE]->(s9),
(s10)-[:ROUTE]->(s11),
(s11)-[:ROUTE]->(s10),
(s11)-[:ROUTE]->(s12),
(s12)-[:ROUTE]->(s11),
(s12)-[:ROUTE]->(s13),
(s13)-[:ROUTE]->(s12),
(s13)-[:ROUTE]->(s14),
(s14)-[:ROUTE]->(s13),
(s14)-[:ROUTE]->(s15),
(s15)-[:ROUTE]->(s14),
(s15)-[:ROUTE]->(s16),
(s16)-[:ROUTE]->(s15),
(s16)-[:ROUTE]->(s17),
(s17)-[:ROUTE]->(s16),
(s17)-[:ROUTE]->(s18),
(s18)-[:ROUTE]->(s17),
(s18)-[:ROUTE]->(s19),
(s19)-[:ROUTE]->(s18),
(s19)-[:ROUTE]->(s20),
(s20)-[:ROUTE]->(s19),
(s20)-[:ROUTE]->(s21),
(s21)-[:ROUTE]->(s20),
(s21)-[:ROUTE]->(s22),
(s22)-[:ROUTE]->(s21),
(s22)-[:ROUTE]->(s23),
(s23)-[:ROUTE]->(s22),
(s23)-[:ROUTE]->(s24),
(s24)-[:ROUTE]->(s23);

// Create connections for route 5
MATCH (s0:Stop {name: 'Budišovice,Zátiší'})
MATCH (s1:Stop {name: 'Horní Lhota'})
MATCH (s2:Stop {name: 'Dolní Lhota,osada'})
MATCH (s3:Stop {name: 'Dolní Lhota'})
MATCH (s4:Stop {name: 'Dolní Lhota,U Obory'})
MATCH (s5:Stop {name: 'Krásné Pole'})
MATCH (s6:Stop {name: 'Vřesina,Nová Plzeň'})
MATCH (s7:Stop {name: 'Vřesina'})
MATCH (s8:Stop {name: 'Poruba,koupaliště'})
MATCH (s9:Stop {name: 'Poruba,Vřesinská'})
CREATE (s0)-[:ROUTE]->(s1),
(s1)-[:ROUTE]->(s0),
(s1)-[:ROUTE]->(s2),
(s2)-[:ROUTE]->(s1),
(s2)-[:ROUTE]->(s3),
(s3)-[:ROUTE]->(s2),
(s3)-[:ROUTE]->(s4),
(s4)-[:ROUTE]->(s3),
(s4)-[:ROUTE]->(s5),
(s5)-[:ROUTE]->(s4),
(s5)-[:ROUTE]->(s6),
(s6)-[:ROUTE]->(s5),
(s6)-[:ROUTE]->(s7),
(s7)-[:ROUTE]->(s6),
(s7)-[:ROUTE]->(s8),
(s8)-[:ROUTE]->(s7),
(s8)-[:ROUTE]->(s9),
(s9)-[:ROUTE]->(s8);

// Create connections for route 6
MATCH (s0:Stop {name: 'Mor. Ostrava,Plynárny'})
MATCH (s1:Stop {name: 'Důl Jindřich'})
MATCH (s2:Stop {name: 'Stodolní'})
MATCH (s3:Stop {name: 'Elektra'})
MATCH (s4:Stop {name: 'Karolina'})
MATCH (s5:Stop {name: 'Náměstí Republiky'})
MATCH (s6:Stop {name: 'Don Bosco'})
MATCH (s7:Stop {name: 'Dolní Vítkovice'})
MATCH (s8:Stop {name: 'Český dům'})
MATCH (s9:Stop {name: 'Důl Jeremenko'})
MATCH (s10:Stop {name: 'Kolonie Jeremenko'})
MATCH (s11:Stop {name: 'Nádraží Vítkovice'})
MATCH (s12:Stop {name: 'Rodinná'})
MATCH (s13:Stop {name: 'Kpt.Vajdy'})
MATCH (s14:Stop {name: 'Rodimcevova'})
MATCH (s15:Stop {name: 'Zábřeh,vodárna'})
MATCH (s16:Stop {name: 'Kotva'})
MATCH (s17:Stop {name: 'Kino Luna'})
MATCH (s18:Stop {name: '29.dubna'})
MATCH (s19:Stop {name: 'Nové Výškovice'})
MATCH (s20:Stop {name: 'Výškovice'})
CREATE (s0)-[:ROUTE]->(s1),
(s1)-[:ROUTE]->(s0),
(s1)-[:ROUTE]->(s2),
(s2)-[:ROUTE]->(s1),
(s2)-[:ROUTE]->(s3),
(s3)-[:ROUTE]->(s2),
(s3)-[:ROUTE]->(s4),
(s4)-[:ROUTE]->(s3),
(s4)-[:ROUTE]->(s5),
(s5)-[:ROUTE]->(s4),
(s5)-[:ROUTE]->(s6),
(s6)-[:ROUTE]->(s5),
(s6)-[:ROUTE]->(s7),
(s7)-[:ROUTE]->(s6),
(s7)-[:ROUTE]->(s8),
(s8)-[:ROUTE]->(s7),
(s8)-[:ROUTE]->(s9),
(s9)-[:ROUTE]->(s8),
(s9)-[:ROUTE]->(s10),
(s10)-[:ROUTE]->(s9),
(s10)-[:ROUTE]->(s11),
(s11)-[:ROUTE]->(s10),
(s11)-[:ROUTE]->(s12),
(s12)-[:ROUTE]->(s11),
(s12)-[:ROUTE]->(s13),
(s13)-[:ROUTE]->(s12),
(s13)-[:ROUTE]->(s14),
(s14)-[:ROUTE]->(s13),
(s14)-[:ROUTE]->(s15),
(s15)-[:ROUTE]->(s14),
(s15)-[:ROUTE]->(s16),
(s16)-[:ROUTE]->(s15),
(s16)-[:ROUTE]->(s17),
(s17)-[:ROUTE]->(s16),
(s17)-[:ROUTE]->(s18),
(s18)-[:ROUTE]->(s17),
(s18)-[:ROUTE]->(s19),
(s19)-[:ROUTE]->(s18),
(s19)-[:ROUTE]->(s20),
(s20)-[:ROUTE]->(s19);

// Create connections for route 7
MATCH (s0:Stop {name: 'Výškovice'})
MATCH (s1:Stop {name: 'Nové Výškovice'})
MATCH (s2:Stop {name: '29.dubna'})
MATCH (s3:Stop {name: 'Kino Luna'})
MATCH (s4:Stop {name: 'Kotva'})
MATCH (s5:Stop {name: 'Zábřeh,vodárna'})
MATCH (s6:Stop {name: 'Zábřeh,OC'})
MATCH (s7:Stop {name: 'Horymírova'})
MATCH (s8:Stop {name: 'Karpatská'})
MATCH (s9:Stop {name: 'SPORT ARÉNA'})
MATCH (s10:Stop {name: 'Palkovského'})
MATCH (s11:Stop {name: 'Hulvácká'})
MATCH (s12:Stop {name: 'Ferona'})
MATCH (s13:Stop {name: 'Střelnice'})
MATCH (s14:Stop {name: 'Nová Ves,vodárna'})
MATCH (s15:Stop {name: 'Nová Ves,vodárna'})
MATCH (s16:Stop {name: 'Svinov,mosty'})
MATCH (s17:Stop {name: 'Třebovice,OC'})
MATCH (s18:Stop {name: 'Třebovická'})
MATCH (s19:Stop {name: 'Telekom.škola'})
MATCH (s20:Stop {name: 'Rektorát VŠB'})
MATCH (s21:Stop {name: 'Hlavní třída'})
MATCH (s22:Stop {name: 'Fakultní nemocnice'})
MATCH (s23:Stop {name: 'Poruba,Vřesinská'})
CREATE (s0)-[:ROUTE]->(s1),
(s1)-[:ROUTE]->(s0),
(s1)-[:ROUTE]->(s2),
(s2)-[:ROUTE]->(s1),
(s2)-[:ROUTE]->(s3),
(s3)-[:ROUTE]->(s2),
(s3)-[:ROUTE]->(s4),
(s4)-[:ROUTE]->(s3),
(s4)-[:ROUTE]->(s5),
(s5)-[:ROUTE]->(s4),
(s5)-[:ROUTE]->(s6),
(s6)-[:ROUTE]->(s5),
(s6)-[:ROUTE]->(s7),
(s7)-[:ROUTE]->(s6),
(s7)-[:ROUTE]->(s8),
(s8)-[:ROUTE]->(s7),
(s8)-[:ROUTE]->(s9),
(s9)-[:ROUTE]->(s8),
(s9)-[:ROUTE]->(s10),
(s10)-[:ROUTE]->(s9),
(s10)-[:ROUTE]->(s11),
(s11)-[:ROUTE]->(s10),
(s11)-[:ROUTE]->(s12),
(s12)-[:ROUTE]->(s11),
(s12)-[:ROUTE]->(s13),
(s13)-[:ROUTE]->(s12),
(s13)-[:ROUTE]->(s14),
(s14)-[:ROUTE]->(s13),
(s14)-[:ROUTE]->(s15),
(s15)-[:ROUTE]->(s14),
(s15)-[:ROUTE]->(s16),
(s16)-[:ROUTE]->(s15),
(s16)-[:ROUTE]->(s17),
(s17)-[:ROUTE]->(s16),
(s17)-[:ROUTE]->(s18),
(s18)-[:ROUTE]->(s17),
(s18)-[:ROUTE]->(s19),
(s19)-[:ROUTE]->(s18),
(s19)-[:ROUTE]->(s20),
(s20)-[:ROUTE]->(s19),
(s20)-[:ROUTE]->(s21),
(s21)-[:ROUTE]->(s20),
(s21)-[:ROUTE]->(s22),
(s22)-[:ROUTE]->(s21),
(s22)-[:ROUTE]->(s23),
(s23)-[:ROUTE]->(s22);

// Create connections for route 8
MATCH (s0:Stop {name: 'Přívoz,Hlučínská'})
MATCH (s1:Stop {name: 'Hlavní nádraží'})
MATCH (s2:Stop {name: 'Náměstí S.Čecha'})
MATCH (s3:Stop {name: 'Muglinovská'})
MATCH (s4:Stop {name: 'Křižíkova'})
MATCH (s5:Stop {name: 'Mor. Ostrava,Plynárny'})
MATCH (s6:Stop {name: 'Důl Jindřich'})
MATCH (s7:Stop {name: 'Stodolní'})
MATCH (s8:Stop {name: 'Elektra'})
MATCH (s9:Stop {name: 'Karolina'})
MATCH (s10:Stop {name: 'Náměstí Republiky'})
MATCH (s11:Stop {name: 'Krajský úřad'})
MATCH (s12:Stop {name: 'Dům energetiky'})
MATCH (s13:Stop {name: 'Mariánské náměstí'})
MATCH (s14:Stop {name: 'Prostorná'})
MATCH (s15:Stop {name: 'Hulváky'})
MATCH (s16:Stop {name: 'Nová Ves,vodárna'})
MATCH (s17:Stop {name: 'Svinov,mosty'})
MATCH (s18:Stop {name: 'Třebovice,OC'})
MATCH (s19:Stop {name: 'Třebovická'})
MATCH (s20:Stop {name: 'Telekom.škola'})
MATCH (s21:Stop {name: 'Poruba,vozovna'})
MATCH (s22:Stop {name: 'Rektorát VŠB'})
MATCH (s23:Stop {name: 'Hlavní třída'})
MATCH (s24:Stop {name: 'Fakultní nemocnice'})
MATCH (s25:Stop {name: 'Poruba,Vřesinská'})
CREATE (s0)-[:ROUTE]->(s1),
(s1)-[:ROUTE]->(s0),
(s1)-[:ROUTE]->(s2),
(s2)-[:ROUTE]->(s1),
(s2)-[:ROUTE]->(s3),
(s3)-[:ROUTE]->(s2),
(s3)-[:ROUTE]->(s4),
(s4)-[:ROUTE]->(s3),
(s4)-[:ROUTE]->(s5),
(s5)-[:ROUTE]->(s4),
(s5)-[:ROUTE]->(s6),
(s6)-[:ROUTE]->(s5),
(s6)-[:ROUTE]->(s7),
(s7)-[:ROUTE]->(s6),
(s7)-[:ROUTE]->(s8),
(s8)-[:ROUTE]->(s7),
(s8)-[:ROUTE]->(s9),
(s9)-[:ROUTE]->(s8),
(s9)-[:ROUTE]->(s10),
(s10)-[:ROUTE]->(s9),
(s10)-[:ROUTE]->(s11),
(s11)-[:ROUTE]->(s10),
(s11)-[:ROUTE]->(s12),
(s12)-[:ROUTE]->(s11),
(s12)-[:ROUTE]->(s13),
(s13)-[:ROUTE]->(s12),
(s13)-[:ROUTE]->(s14),
(s14)-[:ROUTE]->(s13),
(s14)-[:ROUTE]->(s15),
(s15)-[:ROUTE]->(s14),
(s15)-[:ROUTE]->(s16),
(s16)-[:ROUTE]->(s15),
(s16)-[:ROUTE]->(s17),
(s17)-[:ROUTE]->(s16),
(s17)-[:ROUTE]->(s18),
(s18)-[:ROUTE]->(s17),
(s18)-[:ROUTE]->(s19),
(s19)-[:ROUTE]->(s18),
(s19)-[:ROUTE]->(s20),
(s20)-[:ROUTE]->(s19),
(s20)-[:ROUTE]->(s21),
(s21)-[:ROUTE]->(s20),
(s21)-[:ROUTE]->(s22),
(s22)-[:ROUTE]->(s21),
(s22)-[:ROUTE]->(s23),
(s23)-[:ROUTE]->(s22),
(s23)-[:ROUTE]->(s24),
(s24)-[:ROUTE]->(s23),
(s24)-[:ROUTE]->(s25),
(s25)-[:ROUTE]->(s24);

// Create connections for route 10
MATCH (s0:Stop {name: 'Hranečník'})
MATCH (s1:Stop {name: 'Výstaviště'})
MATCH (s2:Stop {name: 'Karolina'})
MATCH (s3:Stop {name: 'Náměstí Republiky'})
MATCH (s4:Stop {name: 'Don Bosco'})
MATCH (s5:Stop {name: 'Dolní Vítkovice Hlubina'})
MATCH (s6:Stop {name: 'Dolní Vítkovice'})
MATCH (s7:Stop {name: 'Důl Jeremenko'})
MATCH (s8:Stop {name: 'Dřevoprodej'})
MATCH (s9:Stop {name: 'Hrabůvka,kostel'})
MATCH (s10:Stop {name: 'Hrabůvka,Poliklinika'})
MATCH (s11:Stop {name: 'Josefa Kotase'})
MATCH (s12:Stop {name: 'Antonína Poledníka'})
MATCH (s13:Stop {name: 'Václava Jiřikovského'})
MATCH (s14:Stop {name: 'Dubina'})
CREATE (s0)-[:ROUTE]->(s1),
(s1)-[:ROUTE]->(s0),
(s1)-[:ROUTE]->(s2),
(s2)-[:ROUTE]->(s1),
(s2)-[:ROUTE]->(s3),
(s3)-[:ROUTE]->(s2),
(s3)-[:ROUTE]->(s4),
(s4)-[:ROUTE]->(s3),
(s4)-[:ROUTE]->(s5),
(s5)-[:ROUTE]->(s4),
(s5)-[:ROUTE]->(s6),
(s6)-[:ROUTE]->(s5),
(s6)-[:ROUTE]->(s7),
(s7)-[:ROUTE]->(s6),
(s7)-[:ROUTE]->(s8),
(s8)-[:ROUTE]->(s7),
(s8)-[:ROUTE]->(s9),
(s9)-[:ROUTE]->(s8),
(s9)-[:ROUTE]->(s10),
(s10)-[:ROUTE]->(s9),
(s10)-[:ROUTE]->(s11),
(s11)-[:ROUTE]->(s10),
(s11)-[:ROUTE]->(s12),
(s12)-[:ROUTE]->(s11),
(s12)-[:ROUTE]->(s13),
(s13)-[:ROUTE]->(s12),
(s13)-[:ROUTE]->(s14),
(s14)-[:ROUTE]->(s13);

// Create connections for route 11
MATCH (s0:Stop {name: 'Poruba,vozovna'})
MATCH (s1:Stop {name: 'Telekom.škola'})
MATCH (s2:Stop {name: 'Třebovická'})
MATCH (s3:Stop {name: 'Třebovice,OC'})
MATCH (s4:Stop {name: 'Svinov,mosty'})
MATCH (s5:Stop {name: 'Nová Ves,vodárna'})
MATCH (s6:Stop {name: 'Střelnice'})
MATCH (s7:Stop {name: 'Ferona'})
MATCH (s8:Stop {name: 'Hulvácká'})
MATCH (s9:Stop {name: 'Palkovského'})
MATCH (s10:Stop {name: 'SPORT ARÉNA'})
MATCH (s11:Stop {name: 'Městský stadion'})
MATCH (s12:Stop {name: 'Most Čs. armády'})
MATCH (s13:Stop {name: 'Nádraží Vítkovice'})
MATCH (s14:Stop {name: 'Rodinná'})
MATCH (s15:Stop {name: 'Kpt.Vajdy'})
MATCH (s16:Stop {name: 'Rodimcevova'})
MATCH (s17:Stop {name: 'Zábřeh,vodárna'})
MATCH (s18:Stop {name: 'Kotva'})
MATCH (s19:Stop {name: 'Kino Luna'})
MATCH (s20:Stop {name: 'Svornosti'})
MATCH (s21:Stop {name: 'Zábřeh'})
CREATE (s0)-[:ROUTE]->(s1),
(s1)-[:ROUTE]->(s0),
(s1)-[:ROUTE]->(s2),
(s2)-[:ROUTE]->(s1),
(s2)-[:ROUTE]->(s3),
(s3)-[:ROUTE]->(s2),
(s3)-[:ROUTE]->(s4),
(s4)-[:ROUTE]->(s3),
(s4)-[:ROUTE]->(s5),
(s5)-[:ROUTE]->(s4),
(s5)-[:ROUTE]->(s6),
(s6)-[:ROUTE]->(s5),
(s6)-[:ROUTE]->(s7),
(s7)-[:ROUTE]->(s6),
(s7)-[:ROUTE]->(s8),
(s8)-[:ROUTE]->(s7),
(s8)-[:ROUTE]->(s9),
(s9)-[:ROUTE]->(s8),
(s9)-[:ROUTE]->(s10),
(s10)-[:ROUTE]->(s9),
(s10)-[:ROUTE]->(s11),
(s11)-[:ROUTE]->(s10),
(s11)-[:ROUTE]->(s12),
(s12)-[:ROUTE]->(s11),
(s12)-[:ROUTE]->(s13),
(s13)-[:ROUTE]->(s12),
(s13)-[:ROUTE]->(s14),
(s14)-[:ROUTE]->(s13),
(s14)-[:ROUTE]->(s15),
(s15)-[:ROUTE]->(s14),
(s15)-[:ROUTE]->(s16),
(s16)-[:ROUTE]->(s15),
(s16)-[:ROUTE]->(s17),
(s17)-[:ROUTE]->(s16),
(s17)-[:ROUTE]->(s18),
(s18)-[:ROUTE]->(s17),
(s18)-[:ROUTE]->(s19),
(s19)-[:ROUTE]->(s18),
(s19)-[:ROUTE]->(s20),
(s20)-[:ROUTE]->(s19),
(s20)-[:ROUTE]->(s21),
(s21)-[:ROUTE]->(s20);

// Create connections for route 12
MATCH (s0:Stop {name: 'Hranečník'})
MATCH (s1:Stop {name: 'Důl Zárubek'})
MATCH (s2:Stop {name: 'Výstaviště'})
MATCH (s3:Stop {name: 'Karolina'})
MATCH (s4:Stop {name: 'Náměstí Republiky'})
MATCH (s5:Stop {name: 'Krajský úřad'})
MATCH (s6:Stop {name: 'Dům energetiky'})
MATCH (s7:Stop {name: 'Mariánské náměstí'})
MATCH (s8:Stop {name: 'Pohraniční'})
MATCH (s9:Stop {name: 'Vítkovice,Mírové nám.'})
MATCH (s10:Stop {name: 'Stará ocelárna'})
MATCH (s11:Stop {name: 'Ředitelství Vítkovic'})
MATCH (s12:Stop {name: 'SPORT ARÉNA'})
MATCH (s13:Stop {name: 'Městský stadion'})
MATCH (s14:Stop {name: 'Most Čs. armády'})
MATCH (s15:Stop {name: 'Provaznická'})
MATCH (s16:Stop {name: 'Hrabůvka,kostel'})
MATCH (s17:Stop {name: 'Hrabůvka,Poliklinika'})
MATCH (s18:Stop {name: 'Josefa Kotase'})
MATCH (s19:Stop {name: 'Antonína Poledníka'})
MATCH (s20:Stop {name: 'Václava Jiřikovského'})
MATCH (s21:Stop {name: 'Dubina'})
CREATE (s0)-[:ROUTE]->(s1),
(s1)-[:ROUTE]->(s0),
(s1)-[:ROUTE]->(s2),
(s2)-[:ROUTE]->(s1),
(s2)-[:ROUTE]->(s3),
(s3)-[:ROUTE]->(s2),
(s3)-[:ROUTE]->(s4),
(s4)-[:ROUTE]->(s3),
(s4)-[:ROUTE]->(s5),
(s5)-[:ROUTE]->(s4),
(s5)-[:ROUTE]->(s6),
(s6)-[:ROUTE]->(s5),
(s6)-[:ROUTE]->(s7),
(s7)-[:ROUTE]->(s6),
(s7)-[:ROUTE]->(s8),
(s8)-[:ROUTE]->(s7),
(s8)-[:ROUTE]->(s9),
(s9)-[:ROUTE]->(s8),
(s9)-[:ROUTE]->(s10),
(s10)-[:ROUTE]->(s9),
(s10)-[:ROUTE]->(s11),
(s11)-[:ROUTE]->(s10),
(s11)-[:ROUTE]->(s12),
(s12)-[:ROUTE]->(s11),
(s12)-[:ROUTE]->(s13),
(s13)-[:ROUTE]->(s12),
(s13)-[:ROUTE]->(s14),
(s14)-[:ROUTE]->(s13),
(s14)-[:ROUTE]->(s15),
(s15)-[:ROUTE]->(s14),
(s15)-[:ROUTE]->(s16),
(s16)-[:ROUTE]->(s15),
(s16)-[:ROUTE]->(s17),
(s17)-[:ROUTE]->(s16),
(s17)-[:ROUTE]->(s18),
(s18)-[:ROUTE]->(s17),
(s18)-[:ROUTE]->(s19),
(s19)-[:ROUTE]->(s18),
(s19)-[:ROUTE]->(s20),
(s20)-[:ROUTE]->(s19),
(s20)-[:ROUTE]->(s21),
(s21)-[:ROUTE]->(s20);

// Create connections for route 14
MATCH (s0:Stop {name: 'Přívoz,Hlučínská'})
MATCH (s1:Stop {name: 'Důl Odra'})
MATCH (s2:Stop {name: 'Sad B.Němcové'})
MATCH (s3:Stop {name: 'Muglinovská'})
MATCH (s4:Stop {name: 'Křižíkova'})
MATCH (s5:Stop {name: 'Důl Jindřich'})
MATCH (s6:Stop {name: 'Stodolní'})
MATCH (s7:Stop {name: 'Elektra'})
MATCH (s8:Stop {name: 'Výstaviště'})
MATCH (s9:Stop {name: 'Hranečník'})
MATCH (s10:Stop {name: 'Osada Míru'})
MATCH (s11:Stop {name: 'Vratimovská'})
MATCH (s12:Stop {name: 'Nová huť učiliště'})
MATCH (s13:Stop {name: 'Nová huť hl.brána'})
MATCH (s14:Stop {name: 'Nová huť již.brána'})
CREATE (s0)-[:ROUTE]->(s1),
(s1)-[:ROUTE]->(s0),
(s1)-[:ROUTE]->(s2),
(s2)-[:ROUTE]->(s1),
(s2)-[:ROUTE]->(s3),
(s3)-[:ROUTE]->(s2),
(s3)-[:ROUTE]->(s4),
(s4)-[:ROUTE]->(s3),
(s4)-[:ROUTE]->(s5),
(s5)-[:ROUTE]->(s4),
(s5)-[:ROUTE]->(s6),
(s6)-[:ROUTE]->(s5),
(s6)-[:ROUTE]->(s7),
(s7)-[:ROUTE]->(s6),
(s7)-[:ROUTE]->(s8),
(s8)-[:ROUTE]->(s7),
(s8)-[:ROUTE]->(s9),
(s9)-[:ROUTE]->(s8),
(s9)-[:ROUTE]->(s10),
(s10)-[:ROUTE]->(s9),
(s10)-[:ROUTE]->(s11),
(s11)-[:ROUTE]->(s10),
(s11)-[:ROUTE]->(s12),
(s12)-[:ROUTE]->(s11),
(s12)-[:ROUTE]->(s13),
(s13)-[:ROUTE]->(s12),
(s13)-[:ROUTE]->(s14),
(s14)-[:ROUTE]->(s13);

// Create connections for route 15
MATCH (s0:Stop {name: 'Dubina'})
MATCH (s1:Stop {name: 'Václava Jiřikovského'})
MATCH (s2:Stop {name: 'Antonína Poledníka'})
MATCH (s3:Stop {name: 'Josefa Kotase'})
MATCH (s4:Stop {name: 'ÚMOb Jih'})
MATCH (s5:Stop {name: 'Rodinná'})
MATCH (s6:Stop {name: 'Kpt.Vajdy'})
MATCH (s7:Stop {name: 'Rodimcevova'})
MATCH (s8:Stop {name: 'Zábřeh,vodárna'})
MATCH (s9:Stop {name: 'Kotva'})
MATCH (s10:Stop {name: 'Kino Luna'})
MATCH (s11:Stop {name: '29.dubna'})
MATCH (s12:Stop {name: 'Nové Výškovice'})
MATCH (s13:Stop {name: 'Výškovice'})
CREATE (s0)-[:ROUTE]->(s1),
(s1)-[:ROUTE]->(s0),
(s1)-[:ROUTE]->(s2),
(s2)-[:ROUTE]->(s1),
(s2)-[:ROUTE]->(s3),
(s3)-[:ROUTE]->(s2),
(s3)-[:ROUTE]->(s4),
(s4)-[:ROUTE]->(s3),
(s4)-[:ROUTE]->(s5),
(s5)-[:ROUTE]->(s4),
(s5)-[:ROUTE]->(s6),
(s6)-[:ROUTE]->(s5),
(s6)-[:ROUTE]->(s7),
(s7)-[:ROUTE]->(s6),
(s7)-[:ROUTE]->(s8),
(s8)-[:ROUTE]->(s7),
(s8)-[:ROUTE]->(s9),
(s9)-[:ROUTE]->(s8),
(s9)-[:ROUTE]->(s10),
(s10)-[:ROUTE]->(s9),
(s10)-[:ROUTE]->(s11),
(s11)-[:ROUTE]->(s10),
(s11)-[:ROUTE]->(s12),
(s12)-[:ROUTE]->(s11),
(s12)-[:ROUTE]->(s13),
(s13)-[:ROUTE]->(s12);

// Create connections for route 17
MATCH (s0:Stop {name: 'Poruba,Vřesinská'})
MATCH (s1:Stop {name: 'Fakultní nemocnice'})
MATCH (s2:Stop {name: 'Hlavní třída'})
MATCH (s3:Stop {name: 'Poruba,vozovna'})
MATCH (s4:Stop {name: 'Telekom.škola'})
MATCH (s5:Stop {name: 'Třebovická'})
MATCH (s6:Stop {name: 'Svinov,mosty'})
MATCH (s7:Stop {name: 'Nová Ves,vodárna'})
MATCH (s8:Stop {name: 'Nová Ves,vodárna'})
MATCH (s9:Stop {name: 'Střelnice'})
MATCH (s10:Stop {name: 'Ferona'})
MATCH (s11:Stop {name: 'Hulvácká'})
MATCH (s12:Stop {name: 'Dolní'})
MATCH (s13:Stop {name: 'Tylova'})
MATCH (s14:Stop {name: 'Rodinná'})
MATCH (s15:Stop {name: 'ÚMOb Jih'})
MATCH (s16:Stop {name: 'Josefa Kotase'})
MATCH (s17:Stop {name: 'Antonína Poledníka'})
MATCH (s18:Stop {name: 'Dubina'})
CREATE (s0)-[:ROUTE]->(s1),
(s1)-[:ROUTE]->(s0),
(s1)-[:ROUTE]->(s2),
(s2)-[:ROUTE]->(s1),
(s2)-[:ROUTE]->(s3),
(s3)-[:ROUTE]->(s2),
(s3)-[:ROUTE]->(s4),
(s4)-[:ROUTE]->(s3),
(s4)-[:ROUTE]->(s5),
(s5)-[:ROUTE]->(s4),
(s5)-[:ROUTE]->(s6),
(s6)-[:ROUTE]->(s5),
(s6)-[:ROUTE]->(s7),
(s7)-[:ROUTE]->(s6),
(s7)-[:ROUTE]->(s8),
(s8)-[:ROUTE]->(s7),
(s8)-[:ROUTE]->(s9),
(s9)-[:ROUTE]->(s8),
(s9)-[:ROUTE]->(s10),
(s10)-[:ROUTE]->(s9),
(s10)-[:ROUTE]->(s11),
(s11)-[:ROUTE]->(s10),
(s11)-[:ROUTE]->(s12),
(s12)-[:ROUTE]->(s11),
(s12)-[:ROUTE]->(s13),
(s13)-[:ROUTE]->(s12),
(s13)-[:ROUTE]->(s14),
(s14)-[:ROUTE]->(s13),
(s14)-[:ROUTE]->(s15),
(s15)-[:ROUTE]->(s14),
(s15)-[:ROUTE]->(s16),
(s16)-[:ROUTE]->(s15),
(s16)-[:ROUTE]->(s17),
(s17)-[:ROUTE]->(s16),
(s17)-[:ROUTE]->(s18),
(s18)-[:ROUTE]->(s17);

// Create connections for route 18
MATCH (s0:Stop {name: 'Dubina'})
MATCH (s1:Stop {name: 'Václava Jiřikovského'})
MATCH (s2:Stop {name: 'Antonína Poledníka'})
MATCH (s3:Stop {name: 'Josefa Kotase'})
MATCH (s4:Stop {name: 'ÚMOb Jih'})
MATCH (s5:Stop {name: 'Rodinná'})
MATCH (s6:Stop {name: 'Tylova'})
MATCH (s7:Stop {name: 'Dolní'})
MATCH (s8:Stop {name: 'Hulvácká'})
MATCH (s9:Stop {name: 'Ferona'})
MATCH (s10:Stop {name: 'Střelnice'})
MATCH (s11:Stop {name: 'Nová Ves,vodárna'})
MATCH (s12:Stop {name: 'Hulváky'})
MATCH (s13:Stop {name: 'Prostorná'})
MATCH (s14:Stop {name: 'Daliborova'})
MATCH (s15:Stop {name: 'Mariánské náměstí'})
MATCH (s16:Stop {name: 'Dům energetiky'})
MATCH (s17:Stop {name: 'Krajský úřad'})
MATCH (s18:Stop {name: 'Náměstí Republiky'})
MATCH (s19:Stop {name: 'Karolina'})
MATCH (s20:Stop {name: 'Elektra'})
MATCH (s21:Stop {name: 'Stodolní'})
MATCH (s22:Stop {name: 'Důl Jindřich'})
MATCH (s23:Stop {name: 'Křižíkova'})
MATCH (s24:Stop {name: 'Muglinovská'})
MATCH (s25:Stop {name: 'Náměstí S.Čecha'})
MATCH (s26:Stop {name: 'Hlavní nádraží'})
CREATE (s0)-[:ROUTE]->(s1),
(s1)-[:ROUTE]->(s0),
(s1)-[:ROUTE]->(s2),
(s2)-[:ROUTE]->(s1),
(s2)-[:ROUTE]->(s3),
(s3)-[:ROUTE]->(s2),
(s3)-[:ROUTE]->(s4),
(s4)-[:ROUTE]->(s3),
(s4)-[:ROUTE]->(s5),
(s5)-[:ROUTE]->(s4),
(s5)-[:ROUTE]->(s6),
(s6)-[:ROUTE]->(s5),
(s6)-[:ROUTE]->(s7),
(s7)-[:ROUTE]->(s6),
(s7)-[:ROUTE]->(s8),
(s8)-[:ROUTE]->(s7),
(s8)-[:ROUTE]->(s9),
(s9)-[:ROUTE]->(s8),
(s9)-[:ROUTE]->(s10),
(s10)-[:ROUTE]->(s9),
(s10)-[:ROUTE]->(s11),
(s11)-[:ROUTE]->(s10),
(s11)-[:ROUTE]->(s12),
(s12)-[:ROUTE]->(s11),
(s12)-[:ROUTE]->(s13),
(s13)-[:ROUTE]->(s12),
(s13)-[:ROUTE]->(s14),
(s14)-[:ROUTE]->(s13),
(s14)-[:ROUTE]->(s15),
(s15)-[:ROUTE]->(s14),
(s15)-[:ROUTE]->(s16),
(s16)-[:ROUTE]->(s15),
(s16)-[:ROUTE]->(s17),
(s17)-[:ROUTE]->(s16),
(s17)-[:ROUTE]->(s18),
(s18)-[:ROUTE]->(s17),
(s18)-[:ROUTE]->(s19),
(s19)-[:ROUTE]->(s18),
(s19)-[:ROUTE]->(s20),
(s20)-[:ROUTE]->(s19),
(s20)-[:ROUTE]->(s21),
(s21)-[:ROUTE]->(s20),
(s21)-[:ROUTE]->(s22),
(s22)-[:ROUTE]->(s21),
(s22)-[:ROUTE]->(s23),
(s23)-[:ROUTE]->(s22),
(s23)-[:ROUTE]->(s24),
(s24)-[:ROUTE]->(s23),
(s24)-[:ROUTE]->(s25),
(s25)-[:ROUTE]->(s24),
(s25)-[:ROUTE]->(s26),
(s26)-[:ROUTE]->(s25);

// Create connections for route 19
MATCH (s0:Stop {name: 'Martinov'})
MATCH (s1:Stop {name: 'Dílny DP Ostrava'})
MATCH (s2:Stop {name: 'Bedřicha Nikodéma'})
MATCH (s3:Stop {name: 'Čistírny'})
MATCH (s4:Stop {name: 'Sokolovská'})
MATCH (s5:Stop {name: 'Třebovická'})
MATCH (s6:Stop {name: 'Třebovice,OC'})
MATCH (s7:Stop {name: 'Svinov,mosty'})
MATCH (s8:Stop {name: 'Nová Ves,vodárna'})
MATCH (s9:Stop {name: 'Střelnice'})
MATCH (s10:Stop {name: 'Ferona'})
MATCH (s11:Stop {name: 'Hulvácká'})
MATCH (s12:Stop {name: 'Dolní'})
MATCH (s13:Stop {name: 'Tylova'})
MATCH (s14:Stop {name: 'Rodinná'})
MATCH (s15:Stop {name: 'ÚMOb Jih'})
MATCH (s16:Stop {name: 'Josefa Kotase'})
MATCH (s17:Stop {name: 'Antonína Poledníka'})
MATCH (s18:Stop {name: 'Václava Jiřikovského'})
MATCH (s19:Stop {name: 'Dubina'})
CREATE (s0)-[:ROUTE]->(s1),
(s1)-[:ROUTE]->(s0),
(s1)-[:ROUTE]->(s2),
(s2)-[:ROUTE]->(s1),
(s2)-[:ROUTE]->(s3),
(s3)-[:ROUTE]->(s2),
(s3)-[:ROUTE]->(s4),
(s4)-[:ROUTE]->(s3),
(s4)-[:ROUTE]->(s5),
(s5)-[:ROUTE]->(s4),
(s5)-[:ROUTE]->(s6),
(s6)-[:ROUTE]->(s5),
(s6)-[:ROUTE]->(s7),
(s7)-[:ROUTE]->(s6),
(s7)-[:ROUTE]->(s8),
(s8)-[:ROUTE]->(s7),
(s8)-[:ROUTE]->(s9),
(s9)-[:ROUTE]->(s8),
(s9)-[:ROUTE]->(s10),
(s10)-[:ROUTE]->(s9),
(s10)-[:ROUTE]->(s11),
(s11)-[:ROUTE]->(s10),
(s11)-[:ROUTE]->(s12),
(s12)-[:ROUTE]->(s11),
(s12)-[:ROUTE]->(s13),
(s13)-[:ROUTE]->(s12),
(s13)-[:ROUTE]->(s14),
(s14)-[:ROUTE]->(s13),
(s14)-[:ROUTE]->(s15),
(s15)-[:ROUTE]->(s14),
(s15)-[:ROUTE]->(s16),
(s16)-[:ROUTE]->(s15),
(s16)-[:ROUTE]->(s17),
(s17)-[:ROUTE]->(s16),
(s17)-[:ROUTE]->(s18),
(s18)-[:ROUTE]->(s17),
(s18)-[:ROUTE]->(s19),
(s19)-[:ROUTE]->(s18);

