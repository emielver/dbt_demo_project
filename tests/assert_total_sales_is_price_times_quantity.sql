SELECT
    date,
    customer_id,
    product_id,
    quantity,
    price,
    quantity * price as total_sales_amount
FROM {{ ref('sales') }}
WHERE total_sales_amount != quantity * price
