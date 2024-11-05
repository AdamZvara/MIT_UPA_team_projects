import csv
from datetime import datetime

def convert_to_line_protocol(csv_filename, output_filename):
    try:
        with open(csv_filename, newline='', encoding='utf-8') as csvfile, open(output_filename, 'w', encoding='utf-8') as outfile:
            # Write the header to the output file
            outfile.write("# DDL\nCREATE DATABASE driving_tickets\n\n# DML\n# CONTEXT-DATABASE: driving_tickets\n\n")

            valid_lines = [csvfile.readline()] # Read the header
            valid_lines += [line for line in csvfile if line.count("\"") == 2]

            reader = csv.DictReader(valid_lines)
            for row in reader:
                cislo_pripadu = row["Číslo případu"]
                mesto_cinu = row["Místo činu"]
                cislo_zakona = row["Číslo zákona"]
                paragraf = row.get("Paragraf", "")
                odstavec = row.get("Odstavec", "")
                pismeno = row.get("Písmeno", "")[:-1] # Remove bracket from the end
                bod = row.get("Bod", "")

                # Handle empty values in bod, as it will be used as
                if bod == "":
                    bod = 0

                # Skip the row if the case number is not a number
                if not cislo_pripadu.isnumeric():
                    continue

                # Handle location - remove backslashes and quotes
                mesto_cinu = mesto_cinu.replace("\\", "").strip().rstrip().replace("\"", "")

                # Convert the date to Unix timestamp in seconds
                try:
                    date_str = row["Datum spáchání"]
                    date = datetime.strptime(date_str, "%Y-%m-%d")
                    timestamp_s = int(date.timestamp())
                except Exception: # Handle invalid date format
                    continue

                # Create the measurement name - format: <cislo_zakona>-<paragraf>-<odstavec>
                measurement = f"{cislo_zakona}-{paragraf}-{odstavec}"

                # Create tags
                if pismeno == "":
                    tags = ""
                else:
                    tags = f",pismeno={pismeno}"
                    tags += f",bod={bod}"

                # Create fields
                fields = f"misto_cinu=\"{mesto_cinu}\","
                fields += f"cislo_pripadu={cislo_pripadu}"

                # Create the line protocol entry
                line = (
                    f"{measurement}"
                    f"{tags} "
                    f"{fields} "
                    f"{timestamp_s}"
                )

                # Write the line protocol entry to the output file
                outfile.write(line + "\n")

        print(f"Data successfully converted to line protocol and saved to {output_filename}")

    except FileNotFoundError:
        print(f"Error: The file {csv_filename} was not found.")
    except Exception as e:
        print(f"An error occurred: {e}")

# Example usage
filename = "20240101_20240630_dopravniprestupky.csv"
convert_to_line_protocol(filename, "tickets.txt")