{% set fruits=['mango','banana','apple','kiwi','grapes']-%}
{% for i in fruits %}
    {% if i!='banana' %}
        {{- i -}}
    {% else %}
        I hate {{- i -}}      
    {% endif %}  
{% endfor %}
