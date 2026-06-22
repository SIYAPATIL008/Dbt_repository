{{
    config(
        materialized='table'
    )
}}
select
    order_id,
    customer_id,
    order_amount,
    {{ uppercase('order_status') }} as order_status,
    order_created_at
from {{ ref('orders') }}


