{% macro calculate_tax(amount, tax_percent) %}
    ({{ amount }} * {{ tax_percent }} / 100)
{% endmacro %}