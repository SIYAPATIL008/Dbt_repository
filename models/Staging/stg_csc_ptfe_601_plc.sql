{{
    config(
        materialized='view'
    )
}}
select * from {{ ref('csc_ptfe_601_plc') }}