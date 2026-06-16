{{ config(materialized='table') }}

select 
    order_id,
    customer_id,
    order_amount,
    order_status,
    order_created_at
from {{ source('DBT_SIYAPATIL008', 'RAW_ORDERS') }}


{% if is_incremental() %}
where src.created_at > (
      select max(tgt.created_at)
      from {{ this }} tgt
  )
{% endif %}