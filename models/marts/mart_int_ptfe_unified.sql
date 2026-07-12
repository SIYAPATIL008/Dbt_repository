{{
    config(
        materialized='incremental',
        unique_key='machine_unique_id',
        incremental_strategy='merge'
    )
}}

select *
from {{ ref('int_UTC_Validation') }}

{% if is_incremental() %}

where machine_unique_id > (
    select max(machine_unique_id)
    from {{ this }}
)

{% endif %}



