with
    source as (select * from {{ source("stroopwafelshop", "promotions") }}),

    promotions as (

        select
            -- ids
            id as promotion_id,

            -- strings
            name as promotion_name,
            description,

            -- numerics
            cast(discount_rate as numeric) as discount_rate,

            -- dates
            date(start_date) as promotion_start_date,
            date(end_date) as promotion_end_date,

            -- booleans
            is_holiday,

            -- meta
            _airbyte_extracted_at,
            _airbyte_meta,
            _airbyte_raw_id

        from source
    )

select *
from promotions
