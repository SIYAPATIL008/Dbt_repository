{% macro union_count() %}
    {% set relations = [] %}
    {% for model in var('ptfe_models') %}
        {% do relations.append(ref(model)) %}
    {% endfor %}
    {% set queries = [] %}
    {% for relation in relations %}
        {% set query %}
            select
                '{{ relation.identifier }}' as source_table,
                count(*) as row_count
            from {{ relation }}
        {% endset %}
        {% do queries.append(query) %}
    {% endfor %}
    {{ queries | join(' union all ') }}
{% endmacro %}

