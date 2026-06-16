{{ config(
    materialized='incremental',
    incremental_strategy='delete+insert',
    unique_key='customer_id'
) }}

select *
from {{ ref('stg_customers') }}

{% if is_incremental() %}
where created_at > (
    select max(created_at)
    from {{ this }}
)
{% endif %}