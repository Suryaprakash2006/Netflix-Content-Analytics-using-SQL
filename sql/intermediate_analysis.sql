-- =========================================================
-- INTERMEDIATE ANALYSIS
-- =========================================================


-- Problem 16:
-- Find the number of titles added each year

SELECT
    EXTRACT(
        YEAR FROM TO_DATE(
            date_added,
            'Month DD, YYYY'
        )
    ) AS year,

    COUNT(*) AS total

FROM netflix

WHERE date_added IS NOT NULL

GROUP BY year

ORDER BY 2 DESC;



-- Problem 17:
-- Top 10 countries producing Movies

SELECT
    TRIM(
        UNNEST(
            STRING_TO_ARRAY(country, ',')
        )
    ) AS country,

    COUNT(*) AS total

FROM netflix

WHERE type = 'Movie'

GROUP BY country

ORDER BY 2 DESC

LIMIT 10;



-- Problem 18:
-- Top 10 countries producing TV Shows

SELECT
    TRIM(
        UNNEST(
            STRING_TO_ARRAY(country, ',')
        )
    ) AS country,

    COUNT(*) AS total

FROM netflix

WHERE type = 'TV Show'

GROUP BY country

ORDER BY 2 DESC

LIMIT 10;



-- Problem 19:
-- Top 10 directors with the most content

SELECT
    TRIM(
        UNNEST(
            STRING_TO_ARRAY(director, ',')
        )
    ) AS director,

    COUNT(*) AS total

FROM netflix

WHERE director IS NOT NULL

GROUP BY director

ORDER BY total DESC

LIMIT 10;



-- Problem 20:
-- Director with the highest number of Movies

SELECT
    TRIM(
        UNNEST(
            STRING_TO_ARRAY(director, ',')
        )
    ) AS director,

    COUNT(*) AS total

FROM netflix

WHERE
    type = 'Movie'
    AND director IS NOT NULL

GROUP BY director

ORDER BY total DESC

LIMIT 10;



-- Problem 21:
-- Find the most dominant Movie genres

SELECT
    TRIM(
        UNNEST(
            STRING_TO_ARRAY(listed_in, ',')
        )
    ) AS genre,

    COUNT(*) AS total

FROM netflix

WHERE type = 'Movie'

GROUP BY genre

ORDER BY total DESC

LIMIT 10;



-- Problem 22:
-- Find the most dominant TV Show genres

SELECT
    TRIM(
        UNNEST(
            STRING_TO_ARRAY(listed_in, ',')
        )
    ) AS genre,

    COUNT(*) AS total

FROM netflix

WHERE type = 'TV Show'

GROUP BY genre

ORDER BY total DESC

LIMIT 10;



-- Problem 23:
-- Identify the highest-rated content categories

SELECT
    type,
    rating,
    COUNT(*) AS total

FROM netflix

GROUP BY
    type,
    rating

ORDER BY total DESC;



-- Problem 24:
-- Rank countries based on total content production

SELECT
    *,

    RANK() OVER (
        ORDER BY total_content DESC
    ) AS country_rank

FROM
(
    SELECT
        TRIM(
            UNNEST(
                STRING_TO_ARRAY(country, ',')
            )
        ) AS country,

        COUNT(*) AS total_content

    FROM netflix

    WHERE country IS NOT NULL

    GROUP BY country

) AS t1;



-- Problem 25:
-- Calculate the average Movie duration

SELECT
    ROUND(
        AVG(
            SPLIT_PART(
                duration,
                ' ',
                1
            )::INT
        ),
        2
    ) AS avg_movie_duration

FROM netflix

WHERE type = 'Movie';
