{% if is_incremental() %}
SELECT
    date,
    customer_id,
    product_id,
    SUM(quantity) as quantity,
    SUM(quantity * price) as sales_amount
FROM {{ this }}
WHERE date > (SELECT MAX(date) FROM {{ this }})
GROUP BY 1, 2, 3
{% else %}
SELECT
    date,
    customer_id,
    product_id,
    SUM(quantity) as quantity,
    SUM(quantity * price) as sales_amount
FROM {{ ref('sales') }}
WHERE date >= '{{ var("start_date", "2023-01-01") }}'
AND date < '{{ var("end_date", "2023-02-01") }}'
GROUP BY 1, 2, 3
{% endif %}
