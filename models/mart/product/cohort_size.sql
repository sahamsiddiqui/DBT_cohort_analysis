with cohort_size AS (
    SELECT
        ch.cohort_name,
        COUNT(DISTINCT ch.player_id) AS cohort_size



    FROM   {{ ref("user_cohort") }} as ch

    GROUP BY 1
    order by 1  
    
    )


    SELECT * FROM cohort_size



