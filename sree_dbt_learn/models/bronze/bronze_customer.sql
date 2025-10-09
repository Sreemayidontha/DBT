{{ config(materialized='view') }}
select * from {{ source('source', 'dim_customer') }}