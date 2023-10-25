CREATE TABLE t_tereza_cetkovska_project_SQL_secondary_final AS
SELECT 
	c.country,
	c.continent,
	e.`year`,
	e.GDP,
	e.population,
	e.gini 
FROM countries c 
LEFT JOIN economies e 
	ON e.country = c.country 
WHERE e.year >= 2000 
	AND e.year <= 2021
	AND c.continent = 'Europe'
ORDER BY e.year;
