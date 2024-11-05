# Sample input file

import re
from typing import Dict, List, Set
import chardet


class TramRouteParser:
    def __init__(self):
        self.tram_stops_details = None
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
        queries.append("CREATE CONSTRAINT stop_name IF NOT EXISTS FOR (s:Stop) REQUIRE s.name IS UNIQUE;")
        queries.append("")

        # Create stops
        stops_creation = "UNWIND [\n "

        for stop in self.tram_stops_details:
            stops_creation += "{"
            for key, value in stop.items():
                if key == 'name':
                    stops_creation += f"name: '{value}'"
                elif key == 'coordinates':
                    stops_creation += f",location: point({{longitude: {value[0]}, latitude: {value[0]}}})"
                elif key == 'wheelchair_accessible':
                    stops_creation += f", wheelchair_accessible: {value}"

            stops_creation += "},\n"

        stops_creation = stops_creation[:-2] + "\n] AS stop\n"  # removing last comma adding end

        stops_list = sorted(list(self.all_stops))
        stops_creation += """
        CREATE (s:Stop {
            name: stop.name,
            location: point({longitude: stop.longitude, latitude: stop.latitude}),
            wheelchair_accessible: stop.wheelchair_accessible
                }
                )
            WITH s
            RETURN count(*);
            
        """
        queries.append(stops_creation)
        queries.append("")

        self.tram_stops = stops_list

        for route_num, stops in self.routes.items():
            # Hlavička pro linku
            queries.append(f"// Create connections for route {route_num}")

            # Vytvoření MATCH pro všechny zastávky a následně CREATE pro spojení
            route_query = ""

            # Přidání MATCH klauzulí pro všechny zastávky
            for i, stop in enumerate(stops):
                route_query += f"MATCH (s{i}:Stop {{name: '{stop}'}})\n"

            # Přidání CREATE pro všechna spojení
            route_query += "CREATE "
            connections = []
            for i in range(len(stops) - 1):
                connections.append(f"(s{i})-[:ROUTE]->(s{i + 1})")
                connections.append(f"(s{i+1})-[:ROUTE]->(s{i})")

            route_query += ",\n".join(connections) + ";"

            queries.append(route_query)
            queries.append("")


        return "\n".join(queries)

    def create_tram_stops_dict(self, geojson_data):
        tram_stops = []
        visited = set()

        should_visit = set(self.all_stops)


        for feature in geojson_data['features']:
            props = feature['properties']
            coords = feature['geometry']['coordinates']

            stop_name = props['zast_jm']

            if stop_name not in should_visit:
                continue

            should_visit.remove(stop_name)

            if stop_name not in visited:
                visited.add(stop_name)
                tram_stops.append({
                    "name": stop_name,
                    "coordinates": coords,
                    'wheelchair_accessible': props['bezbarier'] == 'ANO'
                })
            else:
                continue

        self.tram_stops_details = tram_stops

        print("/*you havent visited these stops: ", should_visit)
        print("*/")
        return tram_stops


def detect_file_encoding(file_path):
    """Detekuje kódování souboru"""
    with open(file_path, 'rb') as file:
        raw_data = file.read()
    result = chardet.detect(raw_data).get('encoding')
    return result


import json

parser = TramRouteParser()

file_path = 'zastavky_MHD_WGS84_gjson.geojson'

detected_encoding = detect_file_encoding(file_path)



# print(tram_stops)

with open("lines.txt", 'r') as file:
    sample_text = file.read()

parser.parse_routes(sample_text)


# Načtení dat
with open(file_path, 'r', encoding=detected_encoding) as f:
    geojson_data = json.load(f)

# Vytvoření slovníku
tram_stops = parser.create_tram_stops_dict(geojson_data)

cypher_queries = parser.generate_cypher_queries()


print(parser.generate_cypher_queries())
