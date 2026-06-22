{{ config(materialized='table') }}

select
    customer_id,
    {{ uppercase('customer_name')}} as customer_name,
    customer_email,
    {{ uppercase('customer_status') }} as customer_status,
    created_at
from {{ source('DBT_SIYAPATIL008', 'RAW_CUSTOMERS') }} src

{% if is_incremental() %}
where src.customer_id is not null
  and src.created_at >(
      select max(tgt.created_at)
      from {{ this }} tgt
  )
{% endif %}
