{% snapshot customer_snapshot %}

{{
    config(
      unique_key='customer_id',
      strategy='check',
      check_cols=['customer_name','customer_email','customer_status']
    )
}}

select *
from {{ source('DBT_SIYAPATIL008','RAW_CUSTOMERS') }}

{% endsnapshot %}