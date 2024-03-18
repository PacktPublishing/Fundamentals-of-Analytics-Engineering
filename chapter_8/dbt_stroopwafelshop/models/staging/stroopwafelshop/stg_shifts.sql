with
    raw_source as (select * from {{ source("stroopwafelshop", "shifts") }}),

    shifts as (
        select
            -- ids
            FARM_FINGERPRINT(CONCAT(date, employee_id, role, hours)) as shift_id,
            employee_id,

            -- strings
            hours as shift_hours,
            role,

            -- dates
            date(date) as shift_date,

            -- timestamps
            -- Parse the shift's start and end into a timestamp
            parse_timestamp(
                '%Y-%m-%d %H:%M',
                concat(cast(date as string), ' ', split(hours, '-')[offset(0)])
            ) as shift_start_at,
            parse_timestamp(
                '%Y-%m-%d %H:%M',
                concat(cast(date as string), ' ', split(hours, '-')[offset(1)])
            ) as shift_end_at,

            -- meta
            _airbyte_extracted_at,
            _airbyte_meta,
            _airbyte_raw_id

        from raw_source
    ),

    final as (
        select
            *,
            extract(hour from (shift_end_at - shift_start_at)) as shift_duration_hours

        from shifts
    )

select *
from final
