# SQL Projekt pro kurz Datová akademie od společnosti Engeto
Pro prokázání znalosti SQL je úkolem účastníků zpracovat podklady pro zodpovězení několika výzkumných otázek z oblasti dostupnosti základních potravin široké veřejnosti v České republice. Při zpracování projektu pracuji se základními tabulkami:
- **czechia_payroll** - informace o mzdách v různých odvětvích za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR,
- **czechia_price** - informace o cenách vybraných potravin za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR,
- **countries** - všemožné informace o zemích na světě, například hlavní město, měna, národní jídlo nebo průměrná výška populace,
- **economies** - HDP, GINI, daňová zátěž, atd. pro daný stát a rok.

K jednotlivým tabulkám existují číselníky pro upřesnění použitých hodnot. Pro zodpovězení výzkumných otázek vytvářím 2 tabulky:
- **t_tereza_cetkovska_project_SQL_primary_final** - pro data mezd a cen potravin za Českou republiku sjednocených na totožné porovnatelné období – společné roky,
- **t_tereza_cetkovska_project_SQL_secondary_final** - pro dodatečná data o dalších evropských státech obsahující HDP, GINI koeficient a populaci ve stejném období, jako primární přehled pro ČR.


## Výzkumné otázky

1. **Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?**
   Infomrace o mzdách máme v tabulce t_tereza_cetkovska_project_SQL_primary_final dostupné od roku 2000 pro všechny kvartály do roku 2021, kde jsou k dispozici pouze první a druhý kvartál. Pro meziroční srovnání tedy uvažuji roky 2000 až 2020. 
    
2. **Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?**
3. 
4. **Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?**
5. 
6. **Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?**
7. 
8. **Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?**
