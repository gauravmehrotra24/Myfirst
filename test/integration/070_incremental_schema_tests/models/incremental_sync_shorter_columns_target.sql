{{ 
    config(materialized='table') 
}}

with source_data as (

    select * from {{ ref('model_a') }}

)

select
    id,
    'bb' as field1,
    'cc' as field2,
    field3,
    'dd' as field4

from source_data
order by id