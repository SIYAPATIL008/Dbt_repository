select *
from {{ ref('stg_sales') }}
where order_amount < 0

