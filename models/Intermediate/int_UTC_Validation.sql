select
    u.*,
    case
        when u.original_table_name like 'ire%'
            then u.t_stamp_raw
        else convert_timezone(
        
            'UTC',
            u.t_stamp_raw
        )
    end as t_stamp_utc
from {{ ref('int_ptfe_unified') }} u