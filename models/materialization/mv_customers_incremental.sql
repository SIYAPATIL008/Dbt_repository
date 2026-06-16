{{
    config(
        materialized='incremental'
    )
}}
select * from {{ ref('Raw_Customers') }}