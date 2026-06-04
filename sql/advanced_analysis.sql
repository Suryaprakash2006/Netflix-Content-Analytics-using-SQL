-- =========================================================
-- ADVANCED ANALYSIS
-- =========================================================


-- Problem 26:
-- Find the longest Movie released in each year
-- Using Window Functions

SELECT
    title,
    release_year,
    duration

FROM
(
    SELECT
        release_year,

        title,

        SPLIT_PART(
            duration,
            ' ',
            1
        )::INT AS duration,

        RANK() OVER
        (
            PARTITION BY release_year

            ORDER BY
                SPLIT_PART(
                    duration,
                    ' ',
                    1
                )::INT DESC
        ) AS rnk

    FROM netflix

    WHERE
        type = 'Movie'
        AND duration IS NOT NULL

) AS t

WHERE rnk = 1

ORDER BY release_year;



-- Problem 27:
-- Identify the month with the highest content additions

SELECT
    TO_CHAR
    (
        TO_DATE
        (
            date_added,
            'Month DD, YYYY'
        ),
        'Month'
    ) AS month,

    COUNT(*) AS total

FROM netflix

GROUP BY month

ORDER BY total DESC;



-- Problem 28:
-- Calculate the percentage distribution
-- of Movies vs TV Shows

SELECT
    type,

    ROUND
    (
        COUNT(*) * 100.0
        /
        SUM(COUNT(*)) OVER (),
        2
    ) AS percentage

FROM netflix

GROUP BY type;
