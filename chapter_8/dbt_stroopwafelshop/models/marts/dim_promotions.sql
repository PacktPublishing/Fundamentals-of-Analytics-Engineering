with
    stg_promotions as (select * from {{ ref('stg_promotions') }}),

    dim_promotions as (
        select
            -- ids
            promotion_id,

            -- strings
            promotion_name,
            description,

            -- numerics
            discount_rate,

            -- dates
            promotion_start_date,
            promotion_end_date,

            -- booleans
            is_holiday

        from stg_promotions
    )

select *
from dim_promotions
