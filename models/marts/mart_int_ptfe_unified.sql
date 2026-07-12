{{
    config(
        materialized='incremental',
        incremental_strategy='merge',
        unique_key=['machine_unique_id', 't_stamp_raw']
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