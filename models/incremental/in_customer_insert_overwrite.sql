{{ config(
    materialized='incremental',
    incremental_strategy='insert_overwrite',
    partition_by={
    "field": "created_at",
    "data_type": "timestamp"
}
) }}

select *
from {{ ref('stg_customers') }}

{% if is_incremental() %}
where created_at > (
    select max(created_at)
    from {{ this }}
)
{% endif %}

