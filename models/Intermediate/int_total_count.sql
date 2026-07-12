select count(*) as unified_count
from {{ ref('int_UTC_Validation') }}