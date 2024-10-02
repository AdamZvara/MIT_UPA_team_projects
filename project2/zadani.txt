
# Projekt, 2. část: ukládání rozsáhlých dat v NoSQL databázích (zadání, požadavky; Rychlý)

Cílem této části projektu je analyzovat požadavky a navrhnout optimální způsob uložení rozsáhlých dat do vhodné NoSQL databáze tak, aby tato data bylo možno rychle získávat a aktualizovat.

Řešení této části se skládá z několika kroků:

1. Na základě vlastních zkušeností, případně dostupných zkušeností a možností použití NoSQL databází určených druhů, konkrétně:
   - dokumentové schema-free databáze (např. Apache Cassandra)
   - sloupcové databáze (např. HBase)
   - grafové databáze (např. Neo4j)
   - databáze typu klíč-hodnota (např. Redis, LevelDB)

2. Proveďte analýzu požadavků na uložení rozsáhlých dat a struktury této databáze nebo kolekce databází.
   Především určete kritéria, významná pro konkrétní typ dat (datové sady) z daného zdroje, jejich strukturu (schéma), typy datových položek, identifikátory jednotlivých datových řad, vazby mezi daty, možnosti vyhledávání, atd.
   * Včetně následujících kritérií:
     - Jaká bude v této konkrétní datové NoSQL databázi entity vyžadováno vyhledávání datových položek?
     - Jaké bude prováděno třídění datových položek?
     - Jaké jsou požadavky na rychlost vyhledávání a třídění?
     - Jaké jsou požadavky na rychlost ukládání dat?
     - Jaké jsou požadavky na velikost uložených dat?
     - Jaká je předpokládaná struktura dotazů pro každý jednotlivý případ použití?
     - Jaký objem rozsáhlých dat se očekává?
     - Jak často budou data aktualizována?
     - Jakou úroveň škálovatelnosti budou data vyžadovat?
     - Jaké jsou požadavky na dostupnost dat?
     - Jak budou data replikována a distribuována?
     - Jaké jsou požadavky na konzistenci dat?
     - Jaké jsou požadavky na zabezpečení dat?
     - Jaké budou možnosti zálohování a obnovy dat?
   * V této části je nutné navrhnout několik různých způsobů uložení dat (alespoň 3) pro různé typy NoSQL databází.

3. Proveďte rozbor výhod a nevýhod jednotlivých řešení uvedených v bodě 2.

4. Vyberte nejvhodnější řešení a zdůvodněte svůj výběr.

5. Pro vybrané řešení vypracujte detailní návrh struktury databáze, včetně:
   - definice schématu (pokud je relevantní)
   - návrhu indexů
   - návrhu partitioningu (pokud je relevantní)
   - návrhu replikace (pokud je relevantní)

6. Navrhněte základní sadu operací pro práci s daty, včetně:
   - vkládání nových dat
   - aktualizace existujících dat
   - mazání dat
   - vyhledávání dat
   - agregace dat

7. Diskutujte o možných omezeních a výzvách spojených s vaším návrhem a jak by mohly být řešeny.

8. Navrhněte testovací scénáře pro ověření výkonu a škálovatelnosti vašeho řešení.

V práci postupujte podobně jako ve druhé části projektu. Práci je nutné doložit také v odpovídající dokumentaci tak, aby se podle ní dala postoupit další předpokládaná fáze projektu.

Odevzdávání výsledků bude zhotovováno vyučujícím a na stránce řešení můžete získat další uvedené body bodů:

- vhodně navržená struktura a způsob ukládání rozsáhlých dat: 2 body
- výběr vhodné NoSQL databáze v případě odůvodněného projektu, které si dobře vyhovují navrhovanému způsobu uložení vašich konkrétních dat: 1 bod
- popis vhodných dotazů pro rychlé získávání relevantních dat z databáze, možností řešení složitějších dotazů apod.: takový projekt může získat maximálně 4 body, což je i základní bodové ohodnocení
- pokud budete chtít získat další body, popište ještě další možnosti optimalizace rychlosti přístupu k datům pomocí indexů či jiných přístupů k optimalizaci úložiště
- pokud chcete získat ještě více bodů (případně plný počet bodů), popište další možnosti zpracování dat, případné další možnosti rozšíření projektu apod. dle vlastní úvahy; další rozšíření diskutujte s vyučujícím
