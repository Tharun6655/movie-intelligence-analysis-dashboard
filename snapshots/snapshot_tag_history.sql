
{% snapshot snapshot_tag_history %}

{{
    config(
        target_schema='SNAPSHOTS',
        unique_key='unique_key',
        strategy='timestamp',
        updated_at='tag_timestamp',
        invalidate_hard_deletes=True
    )
}}

SELECT
    SHA2(
        CONCAT_WS(
            '|',
            COALESCE(TO_VARCHAR(user_id), 'NULL'),
            COALESCE(TO_VARCHAR(movie_id), 'NULL'),
            COALESCE(tag, 'NULL')
        ),
        256
    ) AS unique_key,

    user_id,
    movie_id,
    tag,
    CAST(tag_timestamp AS TIMESTAMP_NTZ) AS tag_timestamp

FROM {{ ref('src_tags') }}

{% endsnapshot %}
