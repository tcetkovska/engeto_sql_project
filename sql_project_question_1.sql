CREATE TABLE t_tereza_cetkovska_auxiliary_2 AS	
SELECT 
	tc.payroll_year,
	tc.industry_branch_code,
	round(avg(tc.value_payroll),0) AS average_wage
FROM t_tereza_cetkovska_project_SQL_primary_final tc
WHERE tc.industry_branch_code IS NOT NULL 
	AND tc.value_type_code = 5958
	AND tc.calculation_code =200
	AND tc.payroll_year IN (2000,2020)
GROUP BY tc.industry_branch_code, tc.payroll_year; 

SELECT 
	ttca.industry_branch_code,
	count(ttca.payroll_year) 
FROM t_tereza_cetkovska_auxiliary_2 ttca 
GROUP BY ttca.industry_branch_code;

SELECT 
	*
FROM t_tereza_cetkovska_auxiliary_2 ttca; 

SELECT   
	tc.payroll_year,
	tc2.payroll_year AS prev_payroll_year,
	tc.industry_branch_code,
	cpib.name,
	round(avg(tc.value_payroll),0) AS average_wage,
	tc2.average_wage AS average_wage_prev_year,
	(round(avg(tc.value_payroll)/tc2.average_wage,2)-1) *100 AS percentage_year_on_year_change
FROM t_tereza_cetkovska_project_SQL_primary_final tc 
LEFT JOIN (   
   			SELECT 
   				tc.payroll_year,
   				tc.industry_branch_code,
   				round(avg(tc.value_payroll),0) AS average_wage
   			FROM t_tereza_cetkovska_project_SQL_primary_final tc
   			WHERE tc.industry_branch_code IS NOT NULL
 	AND tc.value_type_code = 5958
	AND tc.calculation_code = 200
   			GROUP BY tc.payroll_year, tc.industry_branch_code
   		    ) tc2
   	ON tc2.payroll_year+1=tc.payroll_year
   	AND tc2.industry_branch_code=tc.industry_branch_code
 LEFT JOIN czechia_payroll_industry_branch cpib
 	ON	cpib.code = tc.industry_branch_code
 WHERE tc.industry_branch_code IS NOT NULL
 	AND tc2.payroll_year IS NOT NULL
 	AND tc.value_type_code = 5958
	AND tc.calculation_code = 200
 GROUP BY tc.industry_branch_code, tc.payroll_year;  
 
