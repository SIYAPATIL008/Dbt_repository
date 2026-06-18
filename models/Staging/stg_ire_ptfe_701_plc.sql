{{
    config(
        materialized='view'
    )
}}
select * from {{ ref('ire_ptfe_701_plc') }}