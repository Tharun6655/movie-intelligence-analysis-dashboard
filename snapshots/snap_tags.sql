{%{% snapshot   %}

{{
   config(
       target_database='snapshots',
       unique_key=['user_id','movie_id','tag']
       strategy='timestamp',
       updated_at='tag_timestamp',
       invalidate_hard_deletes=True
   )
}}
SELECT 
    {{dbt_utils.generate_surrogate_key(['user_id','movie_id','tag'])}}
    user_id,
    movie_id,
    tag,
    CAST(tag_timestamp as TIMESTAMP_NTZ) AS tag_timestamp
FROM {{ref("src_tags")}}
LIMIT  100 
{% endsnapshot %}%}  