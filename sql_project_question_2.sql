SELECT 
	ttc.payroll_year, 
	round(avg(ttc.value_payroll),0) AS average_wage,
	cpc.name, 
	round(ttc.average_value_price,0) AS average_price,
	round(avg(ttc.value_payroll)/ttc.average_value_price,0) AS how_many_litres_kilos,
	cpc.price_unit 
FROM t_tereza_cetkovska_project_SQL_primary_final ttc
LEFT JOIN czechia_price_category cpc 
	ON cpc.code = ttc.category_code 
WHERE ttc.value_type_code = 5958
	AND ttc.calculation_code = 200
	AND ttc.category_code IN (114201,111301)
	AND ttc.payroll_year IN (2006,2018)
GROUP BY ttc.payroll_year, ttc.category_code; 