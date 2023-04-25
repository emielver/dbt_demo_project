WITH total_salary_by_dept AS (
    {{ total_salary_by_department('Sales') }}
    UNION ALL
    {{ total_salary_by_department('Marketing') }}
    UNION ALL
    {{ total_salary_by_department('Engineering') }}
)
SELECT
    department,
    AVG(total_salary) as avg_salary
FROM total_salary_by_dept
GROUP BY department
