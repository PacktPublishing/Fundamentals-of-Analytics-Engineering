with
    raw_source as (select * from {{ source("stroopwafelshop", "sales_lines") }}),

    sales_lines as (
        select
            -- ids
            id as sales_line_id,
            sales_id,
            product_id,
            promotion_id,

            -- Only generate a surrogate key for the promotion if it is not null

            -- numerics
            cast(quantity_sold as integer) as quantity_sold,
            cast(discount_rate as numeric) as discount_rate,
            cast(unit_price as numeric) as unit_price,
            cast(unit_discount as numeric) as unit_discount,
            cast(total_price as numeric) as total_price,
            cast(total_discount as numeric) as total_discount,

            -- meta
            _airbyte_extracted_at,
            _airbyte_meta,
            _airbyte_raw_id

        from raw_source
    )

select *
from sales_lines
