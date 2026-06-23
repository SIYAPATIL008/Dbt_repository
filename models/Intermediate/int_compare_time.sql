select
    original_table_name as table_name,
    t_stamp_raw,t_stamp_utc
from {{ ref('int_UTC_Validation') }}

