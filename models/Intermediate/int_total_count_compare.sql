with source_total as (

    select
        sum(row_count) as source_total
    from {{ ref('int_record_count_validation') }}

)

select
    source_total,
    (
        select unified_count
        from {{ ref('int_total_count') }}
    ) as target_total

from source_total