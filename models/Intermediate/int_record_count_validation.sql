select 'stg_csc_ptfe_601_plc' as source_table, count(*) as count
from {{ ref('stg_csc_ptfe_601_plc') }}

union all

select 'stg_bnj_ptfe_701_plc', count(*)
from {{ ref('stg_bnj_ptfe_701_plc') }}

union all

select 'stg_aiken_ptfe_901_plc', count(*)
from {{ ref('stg_aiken_ptfe_901_plc') }}

union all

select 'stg_ire_ptfe_701_plc', count(*)
from {{ ref('stg_ire_ptfe_701_plc') }}

