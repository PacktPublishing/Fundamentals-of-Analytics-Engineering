with
    stg_products as (select * from {{ ref('stg_products') }}),

    dim_products as (
        select
            -- ids
            product_id,

            -- strings
            product_name,

            -- numerics
            unit_cost,
            unit_price

        from stg_products
    )

select *
from dim_products
