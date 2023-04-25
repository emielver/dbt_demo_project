{{
    config(
        materialized='view'
    )
}}

{% if is_incremental() %}
SELECT
    date,
    customer_id,
    product_id,
    SUM(quantity) as quantity,
    SUM(quantity * price) as sales_amount
FROM {{ this }}
WHERE date > (SELECT MAX(date) FROM {{ ref('sales_daily') }})
GROUP BY 1, 2, 3
{% else %}
SELECT
    date,
    customer_id,
    product_id,
    SUM(quantity) as quantity,
    SUM(quantity * price) as sales_amount
FROM {{ ref('sales') }}
WHERE date < {{ start_date }}
GROUP BY 1, 2, 3
{% endif %}
