{{ config(materialized='table') }}

select
    customer_id,
    customer_name,
    customer_email,
    customer_status,
    created_at
from {{ ref('stg_customers') }}