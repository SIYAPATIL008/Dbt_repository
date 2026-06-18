{% macro union_ptfe_sources(relations) %}

{{ dbt_utils.union_relations(
    relations=relations
) }}

{% endmacro %}  

