{{
    config(
        materialized='table'
      
    )
}}
select
    customer_id,
    {{ uppercase('customer_name') }} as customer_name,
    customer_email,
    {{ uppercase('customer_status') }} as customer_status,
    created_at
from {{ ref('customers') }}
where customer_id is not null

