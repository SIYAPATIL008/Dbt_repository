{{
    config(
        materialized='view'
    )
}}
select * from {{ ref('demo_ptfe_801_plc') }}