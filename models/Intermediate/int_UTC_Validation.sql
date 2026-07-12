{{
    config(
        materialized='incremental',
        incremental_strategy='merge',
        unique_key=['machine_unique_id', 't_stamp_raw']
    )
}}
select
    u.*,
    case
        when u.original_table_name like 'ire%'
            then u.t_stamp_raw
        else convert_timezone(
            'EST',
            'UTC',
            u.t_stamp_raw
        )
    end as t_stamp_utc
from {{ ref('int_ptfe_unified') }} u
{% if is_incremental() %}
where machine_unique_id > (
    select max(machine_unique_id)
    from {{ this }}
)
{% endif %}

