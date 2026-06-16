{{
    config(
        materialized='table'
      
    )
}}
select
    customer_id,
    upper(customer_name) as customer_name,
    customer_email,
    customer_status,
    created_at
from {{ ref('customers') }}
where customer_id is not null