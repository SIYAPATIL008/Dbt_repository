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

where t_stamp_raw >
(
    select coalesce(max(t_stamp_raw), '1900-01-01'::timestamp)
    from {{ this }}
)

{% endif %}
