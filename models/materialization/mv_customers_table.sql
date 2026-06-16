{{
    config(
        materialized='table'
    )
}}
select * from {{ ref('Raw_Customers') }}

