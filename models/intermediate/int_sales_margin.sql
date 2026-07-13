WITH sales AS (

    SELECT *
    FROM {{ ref('stg_raw__sales') }}

),

product AS (

    SELECT *
    FROM {{ ref('stg_raw__product') }}

)

SELECT
    sales.date_date,
    sales.orders_id,
    sales.pdt_id,
    sales.revenue,
    sales.quantity,
    product.purchase_price,

    sales.quantity * product.purchase_price AS purchase_cost,

    sales.revenue - (sales.quantity * product.purchase_price) AS margin

FROM sales

LEFT JOIN product
    ON sales.pdt_id = product.products_id
    