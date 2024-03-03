with
    stg_sales as (select * from {{ ref("stg_sales") }}),

    stg_sales_lines as (select * from {{ ref("stg_sales_lines") }}),

    fct_sales as (

        select
            -- ids
            sales_line.sales_line_id,
            sale.sales_id as sales_id,
            sale.employee_id as cashier_employee_id,
            sales_line.product_id,
            sales_line.promotion_id,

            -- strings
            sale.payment_type,

            -- numerics
            sales_line.quantity_sold,
            sales_line.discount_rate,
            sales_line.unit_price,
            sales_line.unit_discount,
            sales_line.total_price,
            sales_line.total_discount,

            -- dates
            sale.sold_date,

            -- timestamps
            sale.sold_at,

            -- booleans
            if(sales_line.promotion_id is null, false, true) as has_promotion

        from stg_sales_lines sales_line
        left join stg_sales sale using (sales_id)
    )

select *
from fct_sales
