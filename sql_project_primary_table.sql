CREATE TABLE t_tereza_cetkovska_auxiliary
SELECT
	cp.category_code,
	cp.region_code,
	year(cp.date_from) AS year_price,
	quarter(cp.date_from) AS quarter_price,
	avg(cp.value) AS average_value_price
FROM czechia_price cp
GROUP BY cp.category_code, cp.region_code, year(cp.date_from);


CREATE TABLE t_tereza_cetkovska_project_SQL_primary_final
SELECT
	cpa.value AS value_payroll,
	cpa.value_type_code,
	cpa.unit_code,
	cpa.calculation_code,
	cpa.industry_branch_code,
	cpa.payroll_year,
	cpa.payroll_quarter,
	ttca.category_code,
	ttca.region_code,
	ttca.year_price,
	ttca.quarter_price,
	ttca.average_value_price
FROM czechia_payroll cpa
LEFT JOIN t_tereza_cetkovska_auxiliary ttca
	ON ttca.year_price = cpa.payroll_year
	AND ttca.quarter_price = cpa.payroll_quarter;
