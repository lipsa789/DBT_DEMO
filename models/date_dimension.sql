{{ config(materialized='table') }}
WITH CTE AS (
    SELECT 
    to_timestamp(STARTED_AT) as STARTED_AT,
    DATE(to_timestamp(STARTED_AT)) AS DATE_STARTED_AT,
    HOUR(to_timestamp(STARTED_AT)) AS HOUR_STARTED_AT,

    {{get_day_type('STARTED_AT')}} AS DAYNAME,

    {{get_season('STARTED_AT')}} AS STATION_OF_YEAR

    FROM 
    {{ ref('stg_bike') }}
    where STARTED_AT !='started_at'
)
SELECT * FROM CTE
