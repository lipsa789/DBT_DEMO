{{ config(materialized='table') }}
with trips as(
    select 
    ride_id,
    rideable_type,
    date(to_timestamp(STARTED_AT)) as trip_date,
    start_statio_id as start_station_id,
    end_station_id,
    MEMBER_CSUAL as MEMBER_CASUAL,
    TIMESTAMPDIFF(SECOND,TO_TIMESTAMP(STARTED_AT),TO_TIMESTAMP(ENDED_AT)) AS TRIP_DURATION_SECOND
    from
    {{ source('demo', 'bike') }}
    WHERE RIDE_ID != 'ride_id'
)

select 
* 
from trips