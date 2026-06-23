select count(*) as unified_count
from {{ ref('int_ptfe_unified') }}