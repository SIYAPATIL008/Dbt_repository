{{
    config(
        materialized='ephemeral'
    )
}}
select * from {{ ref('Raw_Customers') }}