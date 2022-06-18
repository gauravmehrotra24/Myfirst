{{ config (
    materialized="incremental",
    unique_key="id",
    on_schema_change="sync_all_columns"
) }}

with

source_data as (
    
    select * from {{ ref('model_a') }}

)

{% if is_incremental() %}

    select
        id,
        'bb' as field1,
        'cc' as field2,
        field3,
        'dd' as field4
    
    from source_data

{% else %}

    select * from source_data
    where id <= 3

{% endif %}