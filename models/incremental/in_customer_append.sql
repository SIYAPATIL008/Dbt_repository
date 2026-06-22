{{
    config(
        materialized='incremental'
    )
}}

select * from {{ source('DBT_SIYAPATIL008', 'RAW_CUSTOMERS') }}
{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where created_at > (select max(created_at) from {{ this }}) 
{% endif %}

