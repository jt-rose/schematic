#!/usr/bin/env bash

mix phx.gen.context GeneratedColumns GeneratedColumn generated_columns \
    database_table_id:references:database_tables \
    column_name:string \
    table_position:integer \
    description:text \
    generation_expression:string