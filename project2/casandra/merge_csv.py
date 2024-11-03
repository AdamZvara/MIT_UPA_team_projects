import pandas as pd
from pathlib import Path
import chardet


def detect_encoding(file_path):
    """
    Detekuje kódování souboru.
    """
    with open(file_path, 'rb') as file:
        raw_data = file.read()
    result = chardet.detect(raw_data)
    return result['encoding']


def merge_csv_files(directory_path, output_encoding='utf-8'):
    """
    Spojí CSV soubory tak, že spojí stejné sloupce pod sebe
    (první sloupec ze všech souborů jde do prvního výsledného sloupce atd.)
    Automaticky detekuje kódování každého vstupního souboru.
    """
    dir_path = Path(directory_path)
    output_path = dir_path / 'merged_output.csv'

    # Seznam pro ukládání dat z každého sloupce
    column_data = {}

    # Seznam možných kódování pro případ selhání detekce
    fallback_encodings = ['windows-1250', 'iso-8859-2', 'cp1250', 'utf-8']

    # Procházíme všechny CSV soubory ve složce
    for file_path in sorted(dir_path.glob('*.csv')):
        try:
            # Detekujeme kódování souboru
            detected_encoding = detect_encoding(file_path)

            # Pokud se detekce nezdařila, vyzkoušíme záložní kódování
            if not detected_encoding:
                for encoding in fallback_encodings:
                    try:
                        df = pd.read_csv(file_path, encoding=encoding)
                        detected_encoding = encoding
                        break
                    except:
                        continue
                if not detected_encoding:
                    print(f"Nepodařilo se detekovat kódování pro soubor {file_path.name}")
                    continue

            # Načteme CSV soubor s detekovaným kódováním
            try:
                df = pd.read_csv(file_path, encoding=detected_encoding)
            except Exception as e:
                print(f"Chyba při čtení souboru {file_path.name}: {str(e)}")
                continue

            # Pro každý sloupec v DataFrame
            for col_idx in range(len(df.columns)):
                # Pokud je to první soubor, inicializujeme seznam pro tento sloupec
                if col_idx not in column_data:
                    column_data[col_idx] = []

                # Přidáme data z tohoto sloupce do odpovídajícího seznamu
                column_data[col_idx].extend(df.iloc[:, col_idx].tolist())

            print(f"Zpracován soubor: {file_path.name} (kódování: {detected_encoding})")

        except Exception as e:
            print(f"Chyba při zpracování souboru {file_path.name}: {str(e)}")
            continue

    if not column_data:
        print("Nebyly nalezeny žádné CSV soubory ke sloučení!")
        return

    # Vytvoříme nový DataFrame z nashromážděných dat
    result_df = pd.DataFrame()
    for col_idx in sorted(column_data.keys()):
        # Použijeme název sloupce z posledního souboru
        col_name = df.columns[col_idx]
        result_df[col_name] = column_data[col_idx]

    # Uložíme výsledek
    try:
        result_df.to_csv(output_path, index=False, encoding=output_encoding)
        print(f"\nSlučování dokončeno! Výsledek uložen do: {output_path}")
        print(f"Celkem zpracováno {len(result_df)} řádků.")
        print(f"Sloupce ve výsledném souboru: {', '.join(result_df.columns)}")
    except Exception as e:
        print(f"Chyba při ukládání výsledného souboru: {str(e)}")


if __name__ == '__main__':
    directory = "."
    merge_csv_files(directory)