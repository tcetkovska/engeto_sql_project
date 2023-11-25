# SQL Projekt pro kurz Datová akademie od společnosti Engeto
Pro prokázání znalosti SQL je úkolem účastníků zpracovat podklady pro zodpovězení několika výzkumných otázek z oblasti dostupnosti základních potravin široké veřejnosti v České republice. Při zpracování projektu pracuji s tabulkami:
- **czechia_payroll** - informace o mzdách v různých odvětvích za několikaleté období, datová sada pochází z Portálu otevřených dat ČR,
- **czechia_price** - informace o cenách vybraných potravin za několikaleté období, datová sada pochází z Portálu otevřených dat ČR,
- **countries** - všemožné informace o zemích na světě, například hlavní město, měna, národní jídlo nebo průměrná výška populace,
- **economies** - HDP, GINI, daňová zátěž, atd. pro daný stát a rok.

K jednotlivým tabulkám existují číselníky pro upřesnění použitých hodnot. Pro zodpovězení výzkumných otázek vytvářím 2 tabulky:
- **t_tereza_cetkovska_project_SQL_primary_final** - pro data mezd a cen potravin za Českou republiku sjednocených na totožné porovnatelné období – společné roky,
- **t_tereza_cetkovska_project_SQL_secondary_final** - pro dodatečná data o dalších evropských státech obsahující HDP, GINI koeficient a populaci ve stejném období, jako primární přehled pro ČR.

## Tvorba primární a sekundární tabulky

### SQL primary table
V primární tabulce potřebuji spojit informace o mzdách a cenách v České republice. Informace o mzdách mám obsaženy v tabulce **czechia_payroll** po jednotlivých letech a kvartálech. Informace o cenách potravin mám k dispozici v tabulce **czechia_price**, kde jsou hodnoty po týdnech. Pro optimalizaci počtu řádků a doby trvání dotazu používám pomocnou tabulku **t_tereza_cetkovska_auxiliary**, kde vybírám pouze potřebné sloupce, převádím datum *date_from* na rok, resp. kvartál, abych následně mohla tuto tabulku napojit na tabulku s informacemi o mzdách. Dále počítám průměrnou cenu potravin seskupenou dle kategorie, regionu a jednotlivých let. Tuto pomocnou tabulku poté napojím na informace o mzdách přes roky a kvartály.

### SQL secondary table
Dodatečná tabulka má obsahovat pouze informace o evropských státech, konkrétně HDP, GINI koeficient a populace za období, které zobrazujme v primárním přehledu. Data v primárním přehledu, tj. informace o mzdách a cenách, jsou společná pouze pro roky 2000 až 2021, z toho důvodu vybírám data do sekundární tabulky pouze v tomto rozsahu. Z tabulky **countries** vyberu pouze státy ležící v Evropě. Případné překlepy a dodatečné mezery jsem ověřila přes SELECT DISTINCT, kde vidím kontinent Evropa pouze jednou. K vybraným státům doplním požadované informace za jednotlivé roky z tabulky **economies**.

## Výzkumné otázky

1. **Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?**
   Informace o mzdách mám v tabulce t_tereza_cetkovska_project_SQL_primary_final dostupné od roku 2000 po rok 2021. Pro rok 2000 jdou dostupná data pro všechny kvartály, rok 2021 má k dispozici pouze první a druhý kvartál. Pro meziroční srovnání tedy uvažuji roky 2000 až 2020. Porovnáním přepočtené průměrné hrubé mzdy na zaměstnance pouze za roky 2000 a 2020 v pomocné tabulce je na první pohled vidět, že mzdy v tomto období vzrostly ve všech odvětvích. Nelze však říci, že mzdy rostly každý rok. Pokud se podíváme na meziroční srovnání, ve všech odvětvích došlo alespoň jednou k meziročnímu poklesu.
    
2. **Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?**
   Informace o mzdách mám v primární tabulce dostupné od roku 2000 do roku 2021, nicméně informace o cenách mléka a chleba jsou k dispozici od roku 2006 do roku 2018. Z toho důvodu beru jako první srovnatelné období rok 2006 a jako poslední rok 2018. Průměrnou cenu mléka a chleba porovnávám v těchto letech s přepočtenou průměrnou hrubou mzdou. V roce 2006 je možné si za průměrnou mzdu koupit 1432 kg chleba a 1599 litrů mléka. V roce 2018 je to 1309 kg chleba a 1601 litrů mléka. Chleba si tedy v roce 2018 koupíme za průměrnou mzdu méně, mléka zhruba stejně. Vyplývá nám, že tempo zdražování chleba je rychlejší než tempo růstu průměrné hrubé mzdy. Cena mléka rostla stejným tempem jako průměrná mzda. 

3. **Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?**
   Na základě meziročního srovnání průměrných cen jednotlivých kategorií potravin vidím nejnižší, resp. zápornou změnu v kategorii *Cukr krystalový*, u kterého cena mezi roky 2006 a 2018 klesla z 22 na 16 Kč. Největší pokles u této kategorie vidím mezi roky 2017 a 2018 a to o 20%.

4. **Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?**
   Porovnáním průměrných cen uvedených potravin a přepočtených hrubých mezd na zaměstnance v jednotlivých letech vidím, že procentuální nárůst cen byl výrazně vyšší než procentuální nárůst mezd mezi lety 2011/2012. V tomto období vzostly ceny o 6%, zatímco mzdy klesly o 7%. V ostatních obdobích nebyl rozdíl změny cen a změny mezd vyšší než 10%.

5. **Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?**
   Pro posouzení vlivu HDP na změnu cen a mezd porovnávám meziroční změny všech tří ukazatelů. Pokud budeme uvažovat výraznější nárůst HDP 5% a výše, můžeme říct, že výrazné zvýšení HDP má vliv na nárůst cen, nikoli na nárůst přepočtených průměrných mezd. Mzdy mezi lety 2007/2008 poklesly o 3% i přes 7% nárůst HDP. Obecně nelze říci, že by změna HDP o určité % vyvolala vždy obdobnou změnu v cenách a mzdách. Nárůst HDP o 4% mezi lety 2009/2010 vyvolal pokles jak ve mzdách, tak v cenách. Stejný procentuální nárůst HDP mezi lety 2016/2017 vyvolal pokles v cenách a nárůst ve mzdách. Opět porovnávám roky 2006 až 2018 z důvodu dostupnosti informací o cenách pouze v tomto období.
