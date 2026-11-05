WITH raw_links AS (
  SELECT * FROM MOVIELENS.RAW.RAW_LINKS
)

SELECT
  movieId AS movie_id,
  imbdid AS imdb_id,
  TMBDID AS tmdb_id
FROM raw_links