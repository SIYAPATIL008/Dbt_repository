{{
    config(
        materialized='incremental',
        unique_key='machine_unique_id',
        incremental_strategy='merge'
    )
}}

select *
from {{ ref('bnj_ptfe_701_plc') }}

{% if is_incremental() %}

where machine_unique_id >
(
    select coalesce(max(machine_unique_id), 0)
    from {{ this }}
)

{% endif %}

