
CREATE OR REPLACE TABLE t_tereza_cetkovska_auxiliary AS
SELECT
	ttc.year_price AS year,
	round(ttc.average_value_price,0) AS average_price,
	round(avg(ttc.value_payroll),0) AS average_wage,
	round(ttcp.GDP,0) AS GDP
FROM t_tereza_cetkovska_project_SQL_primary_final ttc
LEFT JOIN t_tereza_cetkovska_project_SQL_secondary_final ttcp
	ON ttcp.`year` = ttc.year_price 
	WHERE ttc.year_price IS NOT NULL
	AND ttc.value_type_code = 5958
	AND ttc.calculation_code = 200
GROUP BY ttc.year_price;


SELECT 
	ttca.`year`,
	ttca2.`year` AS previous_year,
	(round(ttca.average_price/ttca2.average_price,2) - 1) * 100 AS yoy_perc_change_price,
	(round(ttca.average_wage/ttca2.average_wage,2) - 1) * 100 AS yoy_perc_wage,
	(round(ttca.GDP/ttca2.GDP,2) - 1) * 100 AS yoy_perc_change_GDP
FROM t_tereza_cetkovska_auxiliary ttca 
LEFT JOIN t_tereza_cetkovska_auxiliary ttca2 
	ON ttca2.`year` + 1 = ttca.`year` 
	ORDER BY ttca.`year`; 