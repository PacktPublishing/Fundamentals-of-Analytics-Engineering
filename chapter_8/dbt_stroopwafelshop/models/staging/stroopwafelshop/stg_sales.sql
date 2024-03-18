with
    raw_source as (select * from {{ source("stroopwafelshop", "sales") }}),

    sales as (
        select

            -- ids
            sales_id,
            employee_id,

            -- strings
            payment_type,

            -- numerics
            cast(total_price as numeric) as total_price,
            cast(total_discount as numeric) as total_discount,

            -- dates
            date(date) as sold_date,

            -- timestamps
            timestamp(date(date) || ' ' || time) as sold_at,

            -- meta
            _airbyte_extracted_at,
            _airbyte_meta,
            _airbyte_raw_id

        from raw_source
    )

select *
from sales
