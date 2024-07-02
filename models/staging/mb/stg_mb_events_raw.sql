with 

source as (

    select * from {{ source('mb', 'events_raw') }}

),

renamed as (

    select
        event_id,
    event_name,
    date(TIMESTAMP_SECONDS(event_timestamp)) AS event_date,
    JSON_EXTRACT_SCALAR(event_data, '$.game_mode') AS game_mode,
    JSON_EXTRACT_SCALAR(event_data, '$.match_id') AS match_id,
    JSON_EXTRACT_SCALAR(event_data, '$.player_id') AS player_id,
    JSON_EXTRACT_SCALAR(event_data, '$.region') AS region,
    JSON_EXTRACT_SCALAR(event_data, '$.session_id') AS session_id,
    month, year, day

    from source
    where event_id is not null
    and event_name in ( 'player_match_created', 'player_match_failure',
       'player_match_started', 'player_match_allocated',
       'polar_player_login_event', 'polar_hero_match_finish_event' )
     group by 1,2,3,4,5,6,7,8,9,10,11

)

select * from renamed
