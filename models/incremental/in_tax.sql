select
    order_id,
    order_amount,
    {{ calculate_tax('order_amount', 18) }} as tax_amount
from {{ ref('stg_sales') }}
