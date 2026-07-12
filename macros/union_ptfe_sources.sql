{% macro union_ptfe_sources() %}

    {% set relations = [] %}

    {% for model in var('ptfe_models') %}
        {% do relations.append(ref(model)) %}
    {% endfor %}

    {{ dbt_utils.union_relations(relations=relations) }}

{% endmacro %}