SELECT
    movieId AS movie_id,
    tagId AS tag_id,
    relevance
FROM {{ source('netflix', 'r_genome_scores') }}