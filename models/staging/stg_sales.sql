{{
    config(
        materialized='table'
    )
}}
select 
order_id,
customer_id,
order_amount
from {{ source('DBT_SIYAPATIL008', 'RAW_SALES') }} src

{% if is_incremental() %}
where src.created_at > (
      select max(tgt.created_at)
      from {{ this }} tgt
  )
{% endif %}
