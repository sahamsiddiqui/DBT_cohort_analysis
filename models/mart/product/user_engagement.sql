with 
engagement AS (
    SELECT
       ch.player_id,
       ch.cohort_name,
       ch.cohort_date as cohort_date,
       raw.event_date AS engagement_date,
       DATE_DIFF(raw.event_date ,ch.cohort_date, DAY) as day_number
    FROM
        {{ref("stg_mb_events_raw")}} as raw

        JOIN {{ref('user_cohort')}} as ch

        ON ch.player_id = raw.player_id

        where raw.event_name = 'player_match_created'
    

        GROUP BY 1,2,3,4,5
        order by 1,4
)


SELECT * from engagement