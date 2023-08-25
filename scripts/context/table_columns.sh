#!/usr/bin/env bash

mix phx.gen.context TableColumns TableColumn table_columns \
    table_id:references:database_tables \
    column_name:string \
    config:map \
    description:text \
    is_primary_key:boolean \
    is_nullable:boolean \
    is_unique:boolean \
    deleted:boolean \
    deleted_at:utc_datetime