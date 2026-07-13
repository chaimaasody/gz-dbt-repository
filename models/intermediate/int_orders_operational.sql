WITH orders_margin AS (

    SELECT *
    FROM {{ ref('int_orders_margin') }}

),

ship AS (

    SELECT *
    FROM {{ ref('stg_raw__ship') }}

)

SELECT
    orders_margin.orders_id,
    orders_margin.date_date,
    orders_margin.revenue,
    orders_margin.quantity,
    orders_margin.purchase_cost,
    orders_margin.margin,
    ship.shipping_fee,
    ship.logcost,
    ship.ship_cost,

    orders_margin.margin
    + ship.shipping_fee
    - ship.logcost
    - ship.ship_cost AS operational_margin

FROM orders_margin

LEFT JOIN ship
ON orders_margin.orders_id = ship.orders_id