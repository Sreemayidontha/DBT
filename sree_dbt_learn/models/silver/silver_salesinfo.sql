with sales as(
    select sales_id, product_sk,customer_sk,{{multiply('unit_price','quantity')}} as sales_amount,
    gross_amount
    from {{ ref('bronze_sales') }}
),
product as (
    select product_sk,product_name,category
    from {{ ref('bronze_product') }}
),
customer as (
    select customer_sk,gender
    from {{ ref('bronze_customer') }}
),
joined_query as(
select sales.*,product.product_name,product.category,customer.gender from sales
join product on sales.product_sk=product.product_sk
join customer on sales.customer_sk=customer.customer_sk
)
select category,gender,sum(sales_amount) as total_sales_amount
from  joined_query
group by category,gender
order by total_sales_amount desc