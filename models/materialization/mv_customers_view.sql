{{
    config(
        materialized='view'
    )
}}
select * from {{ ref('Raw_Customers') }}