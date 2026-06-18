select
    *,
    case
        when original_table_name = 'csc_ptfe_601_plc'
            then convert_timezone('America/Chicago', 'UTC', t_stamp_raw)

        when original_table_name = 'bnj_ptfe_701_plc'
            then convert_timezone('America/New_York', 'UTC', t_stamp_raw)

        when original_table_name = 'aiken_ptfe_901_plc'
            then convert_timezone('America/New_York', 'UTC', t_stamp_raw)

        when original_table_name = 'ire_ptfe_701_plc'
            then t_stamp_raw

    end as t_stamp_utc
from {{ ref('int_ptfe_unified') }}   





