

# Sample input text
sample_text = \
"""
1) Hlavní nádraží – Náměstí Svatopluka Čecha – Muglinovská – Křižíkova – Důl Jindřich – Stodolní – Elektra – Karolina – Náměstí Republiky – Don Bosco – Dolní Vítkovice Hlubina – Dolní Vítkovice – Český dům – Důl Jeremenko – Kolonie Jeremenko – Moravská – Dřevoprodej – Hrabůvka, kostel – Hrabůvka, Poliklinika – Josefa Kotase – Antonína Poledníka – Václava Jiřikovského – Dubina
2) Hlavní nádraží – Náměstí Svatopluka Čecha – Muglinovská – Křižíkova – Důl Jindřich – Stodolní – Elektra – Karolina – Náměstí Republiky – Don Bosco – Dolní Vítkovice Hlubina – Dolní Vítkovice – Vítkovice, Mírové náměstí – Stará ocelárna – Ředitelství Vítkovic – SPORT ARÉNA – Karpatská – Horymírova – Zábřeh, OC – Zábřeh, vodárna – Kotva – Kino Luna – 29. dubna – Nové Výškovice – Výškovice
3) Dubina – Václava Jiřikovského – Antonína Poledníka – Josefa Kotase – Náměstí Ostrava-Jih – ÚMOb Jih – Rodinná – Tylova – Dolní – Palkovského – Ředitelství Vítkovic – Stará ocelárna – Vítkovice,Mírové náměstí – Pohraniční – Vagonka – Mariánské náměstí – Prostorná – Hulváky – Nová ves,vodárna – Svinov,mosty – Třebovice,OC – Třebovická – Telekom. škola – Poruba,vozovna
4) Nová huť již.brána – Nová huť hl.brána – Nová huť učiliště – Vratimovská – Kunčičky,kostel – Osada Míru – Teplotechna – Hranečník – Důl Zárubek – U Hradu (x) – Výstaviště – Karolina – Náměstí Republiky – Krajský úřad – Dům energetiky – Mariánské náměstí – Prostorná Hulváky – Nová Ves,vodárna – Svinov,mosty – Třebovice OC – Třebovická – Sokolovská – Čistírny – Bedřicha Nikodéma – Dílny DP Ostrava – Martinov
5) Budišovice,Zátiší – Horní Lhota – Dolní Lhota,osada – Dolní Lhota – Dolní Lhota,U Obory – Krásné Pole – Vřesina,Nová Plzeň – Vřesina – Poruba,koupaliště – Poruba,Vřesinská
6) Mor. Ostrava.Plynárny – Důl Jindřich – Stodolní – Elektra – Karolina – Náměstí Republiky – Don Bosco – Dolní Vítkovice – Český dům – Důl Jeremenko – Kolonie Jeremenko – Nádraží Vítkovice – Rodinná – Kpt.Vajdy – Rodimcevova – Zábřeh,vodárna – Kotva – Kino Luna – 29. dubna – Nové Výškovice – Výškovice
7) Výškovice – Nové Výškovice – 29. dubna – Kino Luna – Kotva – Zábřeh,vodárna – Zábřeh,OC – Horymírova – Karpatská – SPORT ARÉNA – Palkovského – Hulvácká – Ferona – Střelnice – Nová Ves,vodárna – Nová Ves.vodárna – Svinov,mosty – Třebovice,OC – Třebovická – Telekom.škola – (Poruba,vozovna) – Rektorát VŠB – Hlavní třída – Fakultní nemocnice – Poruba,Vřesinská
8) '(Přívoz,Hlučínská, Důl Odra, Sad B.Němcové)' – Hlavní nádraží – Náměstí S. Čecha – Muglinovská – Křižíkova – (Mor. Ostrava,Plynárny) – Důl Jindřich – Stodolní – Elektra – Karolina – Náměstí Republiky – Krajský úřad – Dům energetiky – Mariánské náměstí – Prostorná – Hulváky – Nová Ves,vodárna – Svinov,mosty – Třebovice,OC – Třebovická – Telekom.škola – Poruba,vozovna – Rektorát VŠB – Hlavní třída – Fakultní nemocnice – Poruba,Vřesinská
10) Hranečník – Výstaviště – Karolina – Náměstí Republiky – Don Bosco – Dolní Vítkovice Hlubina – Dolní Vítkovice – Důl Jeremenko – Dřevoprodej – Hrabůvka,kostel – Hrabůvka,Poliklinika – Josefa Kotase – Antonína Poledníka – Václava Jiřikovského – Dubina
11) Poruba,vozovna – Telekom. škola – Třebovická – Třebovice,OC – Svinov,mosty – Nová ves,vodárna – Střelnice – Ferona – Hulvácká – Palkovského – SPORT ARÉNA – Městský stadion – Most Čs. armády – Nádraží Vítkovice – Rodinná – Kpt. Vajdy – Rodimcevova – Zábřeh, vodárna – Kotva – Kino Luna – Svornosti – Zábřeh
12) Hranečník – Důl Zárubek – Výstaviště – Karolina – Náměstí Republiky – Krajský úřad – Dům energetiky – Mariánské náměstí – Vagonka – Pohraniční – Vítkovice,Mírové náměstí – Stará ocelárna – Ředitel.Vítkovic – SPORT ARÉNA – Městský stadion – Most Čs. armády – Provaznická – Hrabůvka, kostel – Hrabůvka, Poliklinika – Josefa Kotase – Antonína Poledníka – Václava Jiřikovského – Dubina
14) Přívoz,Hlučínská – Důl Odra – Sad B.Němcové – Muglinovská – Křižíkova – Důl Jindřich – Stodolní – Elektra – Výstaviště – Hranečník – Osada Míru – Vratimovská – Nová huť učiliště – Nová huť hl.brána – Nová huť již.brána
15) Dubina – Václava Jiřikovského – Antonína Poledníka – Josefa Kotase – Náměstí Ostrava-Jih – ÚMOb Jih – Rodinná – Kpt.Vajdy – Rodimcevova – Zábřeh vodárna – Kotva – Kino Luna – 29. dubna – Nové Výškovice – Výškovice
16) Výstaviště – Náměstí Republiky – Dům kultury Vítkovic – Dům energetiky – Náměstí K. Marxe – Prostorná – Hulváky koupaliště – Nová Ves vodárna – U koupaliště – Bedřiška – Hulvácká – Zábřeh nemocnice – Stadión TJ Vítkovice – Most Československé Armády – Nádraží OV. Vítkovice – Horní – Nemocnice NHKG – Rodimcevova – Zábřeh vodárna – Čujkovova – Volgogradská – Ul. 29. dubna – Nové Výškovice – Výškovice smyčka
17) (Poruba, Vřesinská) – Fakultní nemocnice – Hlavní třída – VŠB-TUO – Poruba,vozovna – Telekom.škola – Třebovická – Třebovice, OC – Svinov,mosty – Nová Ves,vodárna – Nová Ves,vodárna – Střelnice – Ferona – Hulvácká – Dolní – Tylova – Rodinná – ÚMOb Jih – Náměstí Ostrava-Jih – Josefa Kotase – Antonína Poledníka – Václava Jiříkovského – Dubina
18) Dubina – Václava Jiřikovského – Antonína Poledníka – Josefa Kotase – Náměstí Ostrava-Jih – ÚMOb Jih – Rodinná – Tylova – Dolní – Hulvácká – Ferona – Střelnice – Nová Ves,vodárna – Hulváky – Prostorná – Daliborova – Mariánské náměstí – Dům energetiky – Krajský úřad – Náměstí Republiky – Karolina – Elektra – Stodolní – Důl Jindřich – Křižíkova – Muglinovská – Náměstí S.Čecha – Hlavní nádraží
19) Martinov – Dílny DP Ostrava – Bedřicha Nikodéma – Čistírny – Sokolovská – Třebovická – Třebovice,OC – Svinov,mosty – Nová Ves,vodárna – Střelnice – Ferona – Hulvácká – Dolní – Tylova – Rodinná – ÚMOb Jih – Náměstí Ostrava-Jih – Josefa Kotase – Antonína Poledníka – Václava Jiřikovského – Dubina
"""  # Your full text here

import re
from typing import Dict, List, Set


class TramRouteParser:
    def __init__(self):
        self.routes: Dict[str, List[str]] = {}
        self.all_stops: Set[str] = set()

    def parse_route(self, line: str) -> tuple[str, List[str]]:
        """Parse a single route line and return route number and list of stops."""
        # Extract route number and stops
        match = re.match(r'(\d+)\)(.*)', line.strip())
        if not match:
            return None, []

        route_num, stops_text = match.groups()

        # Clean up the stops text and split into individual stops
        stops = [
            stop.strip()
            for stop in stops_text.strip().split('–')
        ]

        # Remove any parenthetical text from stops
        stops = [
            re.sub(r'\([^)]*\)', '', stop).strip()
            for stop in stops
        ]

        # Filter out empty stops
        stops = [stop for stop in stops if stop]

        return route_num, stops

    def parse_routes(self, text: str) -> None:
        """Parse all routes from the input text."""
        lines = text.strip().split('\n')
        for line in lines:
            route_num, stops = self.parse_route(line)
            if route_num:
                self.routes[route_num] = stops
                self.all_stops.update(stops)

    def generate_cypher_queries(self) -> str:
        """Generate Cypher queries for Neo4j database creation."""
        queries = []

        # Create constraint
        queries.append("// Create constraint for unique stop names")
        queries.append("CREATE CONSTRAINT stop_name IF NOT EXISTS FOR (s:Stop) REQUIRE s.name IS UNIQUE;")
        queries.append("")

        # Create stops
        queries.append("// Create all stops")
        stops_list = sorted(list(self.all_stops))
        stops_creation = "UNWIND [\n    " + ",\n    ".join(f"'{stop}'" for stop in stops_list) + "\n] AS stopName\n"
        stops_creation += "CREATE (s:Stop {name: stopName});"
        queries.append(stops_creation)
        queries.append("")

        # Create routes and connections
        for route_num, stops in self.routes.items():
            queries.append(f"// Create route {route_num} and its connections")
            queries.append(f"MERGE (l{route_num}:Line {{number: '{route_num}'}})")

            # Create connections between stops
            for i in range(len(stops) - 1):
                current_stop = stops[i]
                next_stop = stops[i + 1]
                queries.append(f"""WITH l{route_num}
MATCH (s{i}:Stop {{name: '{current_stop}'}})
MATCH (s{i + 1}:Stop {{name: '{next_stop}'}})
CREATE (s{i})-[:NEXT {{line: l{route_num}.number, order: {i + 1}}}]->(s{i + 1});""")
            queries.append("")

        return "\n".join(queries)





# Example usage
parser = TramRouteParser()


parser.parse_routes(sample_text)
cypher_queries = parser.generate_cypher_queries()

print(parser.generate_cypher_queries())

