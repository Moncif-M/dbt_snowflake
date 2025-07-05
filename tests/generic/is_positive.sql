
{% test is_positive(model,column_name,field) %}
select {{column_name}},sum({{field}})
from {{model}}
group by {{column_name}}
having sum({{field}}) < 0
{% endtest %}
