{{ config(materialized='table') }}

with bike as(
    select 
    distinct
    start_statio_id as station_id,
    start_station_name,
    start_lat,
    start_lng
    from
    {{ source('demo', 'bike') }}
    where RIDE_ID != 'ride_id'
)

select * FROM
bike