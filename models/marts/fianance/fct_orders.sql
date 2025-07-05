with orders as (
    select order_id,customer_id from {{ref("stg_orders")}}
),
customers as (
    select customer_id from {{ ref('stg_customers') }}
),
payments as (
    select orderid,amount from {{ ref('stg_stripe__payments') }}
),

final as (
   select order_id,
    customer_id,
    amount 
    from orders join customers using(customer_id)
    join payments on orders.order_id = payments.orderid

)

select * from final