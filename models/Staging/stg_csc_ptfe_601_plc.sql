{{
    config(
        materialized='incremental',
        incremental_strategy='merge',
        unique_key=['machine_unique_id', 't_stamp_raw']
    )
}}

select *
from {{ ref('csc_ptfe_601_plc') }}
{% if is_incremental() %}
where
(
    t_stamp_raw > (
        select max(t_stamp_raw)
        from {{ this }}
    )
)
or
(
    t_stamp_raw = (
        select max(t_stamp_raw)
        from {{ this }}
    )
    and machine_unique_id > (
        select max(machine_unique_id)
        from {{ this }}
        where t_stamp_raw = (
            select max(t_stamp_raw)
            from {{ this }}
        )
    )
)
{% endif %}