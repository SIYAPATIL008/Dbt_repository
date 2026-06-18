{{
    config(
        materialized='view'
    )
}}
select * from {{ ref('bnj_ptfe_701_plc') }}

