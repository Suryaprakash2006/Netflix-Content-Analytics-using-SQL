-- =========================================================
-- BASIC ANALYSIS
-- =========================================================


-- Problem 1:
-- Count the number of Movies vs TV Shows

SELECT
    type,
    COUNT(*) AS total
FROM netflix
GROUP BY type;



-- Problem 2:
-- Find the most common rating for Movies and TV Shows

SELECT
    type,
    rating
FROM
(
    SELECT
        type,
        rating,
        COUNT(*),
        RANK() OVER (
            PARTITION BY type
            ORDER BY COUNT(*) DESC
        ) AS ranking
    FROM netflix
    GROUP BY 1, 2
) AS t1
WHERE ranking = 1;



-- Problem 3:
-- List all Movies released in a specific year (2020)

SELECT
    *
FROM netflix
WHERE
    type = 'Movie'
    AND release_year = 2020;



-- Problem 4:
-- Find the Top 5 countries with the most content on Netflix

SELECT
    UNNEST(STRING_TO_ARRAY(country, ',')) AS country,
    COUNT(show_id) AS total_shows
FROM netflix
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;



-- Problem 5:
-- Identify the longest Movie

SELECT
    *
FROM netflix
WHERE
    type = 'Movie'
    AND duration IS NOT NULL
ORDER BY SPLIT_PART(duration, ' ', 1)::INT DESC
LIMIT 1;



-- Problem 6:
-- Find content added in the last 5 years

SELECT
    *
FROM netflix
WHERE
    TO_DATE(date_added, 'Month DD, YYYY')
    >= CURRENT_DATE - INTERVAL '5 years';



-- Problem 7:
-- Find all Movies / TV Shows by Director Rajiv Chilaka

SELECT
    *
FROM netflix
WHERE director ILIKE '%rajiv chilaka%';



-- Problem 8:
-- List all TV Shows with more than 5 seasons

SELECT
    *
FROM netflix
WHERE
    type = 'TV Show'
    AND SPLIT_PART(duration, ' ', 1)::NUMERIC > 5;



-- Problem 9:
-- Count the number of content items in each genre

SELECT
    UNNEST(STRING_TO_ARRAY(listed_in, ',')) AS genre,
    COUNT(*) AS total
FROM netflix
GROUP BY genre
ORDER BY 2 DESC;



-- Problem 10:
-- Find each year and the average number of content releases in India
-- Return Top 5 years with highest average content release

SELECT
    EXTRACT(
        YEAR FROM TO_DATE(
            date_added,
            'Month DD, YYYY'
        )
    ) AS year,

    COUNT(*) AS content_released,

    ROUND(
        (
            COUNT(*)::NUMERIC /
            (
                SELECT COUNT(*)
                FROM netflix
                WHERE country ILIKE '%india%'
            )::NUMERIC
        ) * 100
    ) AS avg

FROM netflix

WHERE country ILIKE '%india%'

GROUP BY year

ORDER BY 3 DESC

LIMIT 5;



-- Problem 11:
-- List all Movies that are Documentaries

SELECT
    *
FROM netflix
WHERE listed_in ILIKE '%documentaries%';



-- Problem 12:
-- Find all content without a director

SELECT
    *
FROM netflix
WHERE director IS NULL;



-- Problem 13:
-- Find how many Movies actor Salman Khan appeared in during the last 10 years

SELECT
    *
FROM netflix
WHERE
    casts ILIKE '%salman khan%'
    AND release_year >
    EXTRACT(YEAR FROM CURRENT_DATE) - 10;



-- Problem 14:
-- Find the Top 10 actors appearing in Indian-produced content

SELECT
    UNNEST(STRING_TO_ARRAY(casts, ',')) AS actors,
    COUNT(*) AS total_movies
FROM netflix
WHERE country ILIKE '%india%'
GROUP BY actors
ORDER BY 2 DESC
LIMIT 10;



-- Problem 15:
-- Categorize content based on keywords "kill" and "violence"

WITH t1 AS
(
    SELECT
        *,
        CASE
            WHEN description ILIKE '%kill%'
                 OR description ILIKE '%violence%'
            THEN 'Bad'
            ELSE 'Good'
        END AS category
    FROM netflix
)

SELECT
    category,
    COUNT(*) AS total
FROM t1
GROUP BY 1;
