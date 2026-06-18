{{
    config(
        materialized='view'
    )
}}
select * from {{ ref('aiken_ptfe_901_plc') }}