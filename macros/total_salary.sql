{% macro total_salary_by_department(department) %}
SELECT
    department,
    SUM(salary) as total_salary
FROM {{ ref('employees') }}
WHERE department = '{{ department }}'
GROUP BY department
{% endmacro %}
