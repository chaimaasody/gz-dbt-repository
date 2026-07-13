WITH orders_margin AS (

    SELECT *
    FROM {{ ref('int_sales_margin') }}

)

SELECT
    orders_id,
    date_date,
    SUM(revenue) AS revenue,
    SUM(quantity) AS quantity,
    SUM(purchase_cost) AS purchase_cost,
    SUM(margin) AS margin

FROM orders_margin

GROUP BY
    orders_id,
    date_date