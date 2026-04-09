with daily_weather as(
    select 
    date(time) as daily_weather,
    weather,
    temp,
    pressure,
    humidity,
    cloud
    FROM
    {{ source('demo', 'weather') }}

),
daily_weather_aggr as(
    select daily_weather,
    weather,
    round(avg(temp),2) as avg_temp,
    round(avg(pressure),2) as avg_pressure,
    round(avg(humidity),2) as avg_humidity,
    round(avg(cloud),2) as avg_cloud
    from daily_weather
    group by daily_weather,weather
    qualify row_number() over(partition by daily_weather order by count(weather) desc)=1
)

select * 
from
daily_weather_aggr 


