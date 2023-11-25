
CREATE OR REPLACE TABLE t_tereza_cetkovska_auxiliary AS
SELECT
	ttc.year_price,
	ttc.category_code,
	cpc.name,
	round(ttc.average_value_price,0) AS average_price,
	cpc.price_unit 
FROM t_tereza_cetkovska_project_SQL_primary_final ttc
LEFT JOIN czechia_price_category cpc 
	ON cpc.code = ttc.category_code 
	WHERE ttc.year_price IS NOT NULL
GROUP BY ttc.year_price, ttc.category_code;  

SELECT 
	ttca.category_code,
	ttca.name,
	ttca.year_price,
	ttca.average_price, 
	ttca2.year_price AS previous_year,
	ttca2.average_price AS previous_year_price,
	round(ttca.average_price/ttca2.average_price - 1,2) * 100 AS year_on_year_percentage_change
FROM t_tereza_cetkovska_auxiliary ttca 
LEFT JOIN t_tereza_cetkovska_auxiliary ttca2
	ON ttca2.year_price + 1 = ttca.year_price 
	AND ttca2.category_code = ttca.category_code 
	WHERE ttca2.year_price IS NOT NULL 
GROUP BY ttca.category_code, ttca.year_price; 

