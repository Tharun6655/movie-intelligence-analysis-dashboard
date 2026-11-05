
SELECT
    movie_id,
    tag_id,
    relevance
FROM {{ ref('fct_genome_scores') }}
WHERE relevance <= 0
