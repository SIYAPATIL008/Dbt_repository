select
    {{ dbt_utils.generate_surrogate_key(['customer_id']) }} as customer_key,
    *
from {{ ref('stg_customers') }}