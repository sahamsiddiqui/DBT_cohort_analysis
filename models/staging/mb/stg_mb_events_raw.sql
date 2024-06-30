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

)

select * from renamed
