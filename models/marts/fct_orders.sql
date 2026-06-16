{{ config(materialized='table') }}

select
    order_id,
    customer_id,
    order_amount,
    order_status,
    order_created_at
from {{ ref('stg_orders') }}