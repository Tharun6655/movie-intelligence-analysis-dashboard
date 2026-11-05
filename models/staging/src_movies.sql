
SELECT
    movieId AS movie_id,
    titile AS title,
    generes AS genres
FROM {{ source('netflix', 'r_movies') }}
