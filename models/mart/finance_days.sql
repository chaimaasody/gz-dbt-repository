WITH finance AS (

    SELECT *
    FROM {{ ref('int_orders_operational') }}

)

SELECT
    date_date,

    COUNT(DISTINCT orders_id) AS nb_transactions,

    SUM(revenue) AS revenue,

    ROUND(SUM(revenue) / COUNT(DISTINCT orders_id), 2) AS average_basket,

    SUM(operational_margin) AS operational_margin,

    SUM(purchase_cost) AS purchase_cost,

    SUM(shipping_fee) AS shipping_fee,

    SUM(logcost) AS logcost,

    SUM(quantity) AS quantity

FROM finance

GROUP BY
    date_date

ORDER BY
    date_date