with
    raw_source as (select * from {{ source("stroopwafelshop", "products") }}),

    products as (
        select
            -- ids
            id as product_id,

            -- strings
            product_name,

            -- numerics
            cast(unit_cost as numeric) as unit_cost,
            cast(unit_price as numeric) as unit_price,

            -- meta
            _airbyte_extracted_at,
            _airbyte_meta,
            _airbyte_raw_id

        from raw_source
    )

select *
from products
