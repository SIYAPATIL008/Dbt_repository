select
    *,
    {{ dbt_utils.generate_surrogate_key([
        'original_table_name',
        'run_number',
        't_stamp_raw'
    ]) }} as machine_id_new
from {{ ref('int_ptfe_unified') }}


  