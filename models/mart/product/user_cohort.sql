 WITH cohort AS (
    SELECT
        raw.player_id,
        att.attribution_partner as cohort_name,
        MIN(raw.event_date) AS cohort_date
    FROM
        {{ref("stg_mb_events_raw")}} raw
    JOIN {{ref("stg_mb_df_attp")}} att
    ON raw.player_id = att.player_id
    WHERE
       raw.event_name = 'polar_player_login_event'
    GROUP BY
       1,2
)

 
select * from cohort