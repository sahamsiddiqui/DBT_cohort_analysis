with retention_perday_percohort as (
SELECT
    s.cohort_name,s.cohort_size,
    COUNT(DISTINCT (CASE WHEN e.day_number = 0 THEN e.player_id END)) * 100.0/ s.cohort_size  AS day_0,
    COUNT(DISTINCT (CASE WHEN e.day_number = 1 THEN e.player_id END))  * 100.0/ s.cohort_size  AS day_1,
    COUNT(DISTINCT (CASE WHEN e.day_number = 2 THEN e.player_id END))  * 100.0/ s.cohort_size  AS day_2,
    COUNT(DISTINCT (CASE WHEN e.day_number = 3 THEN e.player_id END))  * 100.0/ s.cohort_size  AS day_3,
    COUNT(DISTINCT (CASE WHEN e.day_number = 4 THEN e.player_id END))  * 100.0/ s.cohort_size   AS day_4,
    COUNT(DISTINCT (CASE WHEN e.day_number = 5 THEN e.player_id END))   * 100.0/ s.cohort_size  AS day_5,
    COUNT(DISTINCT (CASE WHEN e.day_number = 6 THEN e.player_id END))  * 100.0/ s.cohort_size   AS day_6,
    COUNT(DISTINCT (CASE WHEN e.day_number = 7 THEN e.player_id END))   * 100.0/ s.cohort_size  AS day_7,
    COUNT(DISTINCT (CASE WHEN e.day_number = 8 THEN e.player_id END))   * 100.0/ s.cohort_size  AS day_8,
    COUNT(DISTINCT (CASE WHEN e.day_number = 9 THEN e.player_id END))  * 100.0/ s.cohort_size   AS day_9,
    COUNT(DISTINCT (CASE WHEN e.day_number = 10 THEN e.player_id END))   * 100.0/ s.cohort_size  AS day_10


FROM {{ref("user_engagement")}} as e

JOIN {{ref("cohort_size")}} as s    ON    e.cohort_name = s.cohort_name

GROUP BY  1,2 ORDER BY 1 ,2 ),

retention_rate as (
select  
cohort_name,cohort_size,
round(day_0 ,2) as day_0,
round(day_1 ,2) as day_1,
round(day_2 ,2) as day_2,
round(day_3 ,2) as day_3,
round(day_4 ,2) as day_4,
round(day_5 ,2) as day_5,
round(day_6 ,2) as day_6,
round(day_7 ,2) as day_7,
round(day_8, 2) as day_8,
round(day_9 ,2) as day_9,
round(day_10 ,2) as day_10

from retention_perday_percohort

)

SELECT * FROM retention_rate




