with 

source as (

    select * from {{ source('mb', 'df_attp') }}

),

cleaned as (

    select
        player_id,
        attribution_partner

    from source
    where player_id is not null
    group by 1,2

)

select * from cleaned
