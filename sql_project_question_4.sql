CREATE OR REPLACE TABLE t_tereza_cetkovska_auxiliary AS
SELECT
	ttc.year_price,
	round(avg(ttc.average_value_price),0) AS average_price,
	round(avg(ttc.value_payroll),0) AS average_wage
FROM t_tereza_cetkovska_project_SQL_primary_final ttc
	WHERE ttc.year_price IS NOT NULL
	AND ttc.value_type_code = 5958
	AND ttc.calculation_code = 200
GROUP BY ttc.year_price;  


SELECT 
	ttca.year_price,
	ttca.average_price, 
	ttca.average_wage, 
	ttca2.year_price AS previous_year,
	ttca2.average_price AS previous_year_price,
	ttca2.average_wage AS previous_year_average_wage,
	round(ttca.average_price/ttca2.average_price - 1,2) * 100 AS yoy_percentage_change_price,
	round(ttca.average_wage/ttca2.average_wage - 1,2) * 100 AS yoy_percentage_change_wage
FROM t_tereza_cetkovska_auxiliary ttca 
LEFT JOIN t_tereza_cetkovska_auxiliary ttca2
	ON ttca2.year_price + 1 = ttca.year_price
	WHERE ttca2.year_price IS NOT NULL
	GROUP BY ttca.year_price  
	ORDER BY ttca.year_price;

