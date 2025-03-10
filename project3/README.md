Cílem této části projektu je vyzkoušet si:
    - provedení explorativní analýzy na datové sadě vytvořené v první části projektu.
    - úpravu datové sady do podoby vhodné pro dolování. Jako příklad dolovací úlohy můžete uvažovat např. predikci ceny výrobku, nebo 
      klasifikaci výrobků do kategorií, nebo hledání skupin podobných výrobků.

Způsob odevzdání (požadované výstupy):
Výsledné řešení (jeden zip archiv) odevzdá pouze vedoucí týmu prostřednictvím IS VUT. Řešení bude obsahovat:
    - Zdrojové kódy pro Vámi provedenou explorativní analýzu a zdrojové kódy pro úpravu datové sady do požadované podoby. Preferovaným 
      programovacím jazykem je Python, ale můžete využít i Javu nebo jazyk R. Řešení je možné odevzdat i formou Jupyter notebooku.
    - Dokumentaci obsahující výsledky explorativní analýzy a popis provedených úprav datové sady ve formátu pdf. K explorativní analýze bude 
      dokumentace obsahovat odpovídající podkapitolu ke každému požadovanému bodu uvedenému níže. Pro prezentaci zjištěných informací 
      využijte vhodné tabulky a grafy. Dále pro každou požadovanou úpravu datové sady uveďte, jakou metodu (jaké metody) jste použili, a 
      zdůvodněte, proč jste vybrali právě tuto metodu (tyto metody). V případě, že některou úpravu provádět nebudete (např. proto, že datová 
      sada neobsahuje odlehlé hodnoty), uveďte v dokumentaci alespoň metodu/metody, kterou byste použít mohli, pokud by to bylo potřeba.
    - Obě výsledné varianty upravené datové sady ve formátu csv. Pro zmenšení velikosti odevzdávaného archivu je možné odevzdat pouze 
      prvních 50 řádků těchto souborů.

Pokyny k řešení:
    1. Proveďte explorativní analýzu datové sady sesbírané v rámci první části projektu. Pro každý následující bod implementujte odpovídající sekci ve zdrojovém kódu a zjištěné výsledky popište v dokumentaci:
        - prozkoumejte jednotlivé atributy datové sady, jejich typ a hodnoty, kterých nabývají (počet hodnot, nejčastější hodnoty, rozsah hodnot atd.)
        - prozkoumejte rozložení hodnot jednotlivých atributů pomocí vhodných grafů, zaměřte se i na to, jak hodnota jednoho či dvou 
          atributů ovlivní rozložení hodnot jiného atributu. Do dokumentace vložte alespoň 5 různých grafů, zobrazujících zjištěná rozložení 
          hodnot. Použijte různé typy grafů (např. bodový graf, histogram, krabicový nebo houslový graf, graf složený z více podgrafů apod.) 
          a věnujte se různým atributům. V dokumentaci také všechny grafy vhodně okomentujte – popište, jaké informace z nich můžeme vyčíst 
          (ve Vašem konkrétním případě).
        - zjistěte, zda zvolená datová sada obsahuje nějaké odlehlé hodnoty (popište, jakým způsobem jste odlehlé hodnoty detekovali, a 
          jaké hodnoty jste objevili).
        - proveďte podrobnou analýzu chybějící hodnot (celkový počet chybějících hodnot, počet objektů s více chybějícími hodnotami atd.).
        - proveďte korelační analýzu numerických případně ordinálních atributů (k analýze využijte grafy i korelační koeficienty).
    2. Připravte 2 varianty datové sady vhodné pro dolovací algoritmy. Můžete uvažovat dolovací úlohy uvedené u cílů této části projektu nebo navrhnout vlastní dolovací úlohy. V případě vlastní dolovací úlohy ji specifikujte v 
       dokumentaci. V rámci přípravy datové sady proveďte následující kroky:
        - Z datové sady odstraňte atributy, které jsou pro danou dolovací úlohu irelevantní. V datové sadě, pokud možno, ponechte jak 
          kategorické, tak i numerické atributy, atributy s chybějícími hodnotami a atributy s odlehlými hodnotami (pokud je původní datová 
          sada obsahuje).
        - Vypořádejte se s chybějícími hodnotami. Pro odstranění těchto hodnot využijte alespoň dvě různé metody pro odstranění chybějících 
          hodnot.
        - Vypořádejte se s odlehlými hodnotami, jsou-li v datové sadě přítomny.
        - Pro jednu variantu datové sady proveďte diskretizaci numerických atributů tak, aby výsledná datová sada byla vhodná pro algoritmy, 
          které vyžadují na vstupu kategorické atributy.
        - Pro druhou variantu datové sady proveďte vhodnou transformaci kategorických atributů na numerické atributy. Dále pak proveďte 
          normalizaci těch atributů, které nespadají do intervalů <0,1> případně <-1,1>. Výsledná datová 
          sada by měla být vhodná pro metody vyžadující numerické vstupy.

Závěrečné poznámky:
    - Při explorativní analýze vytvořte větší množství grafů a do dokumentace se snažte vybrat grafy, které ukazují nějaké zajímavé vztahy mezi atributy.
    - Pokud máte nějakou jinou datovou sadu, kterou byste se rádi zabývali, nebo Vaše datová sada získaná v první části projektu není dobrá, tak mne prosím kontaktujte s žádostí o provedení této části projektu nad jinou datovou sadou. 
      Stejně tak, pokud budete chtít pro explorativní analýzu využít jiný nástroj, tak se ozvěte.
