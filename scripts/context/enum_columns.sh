#!/usr/bin/env bash

mix phx.gen.context DatabaseEnums EnumColumn enum_columns \
    database_enum_id:references:database_enums \
    database_table_id:references:database_tables \
    column_name:string \
    description:text \
    array_depth:integer \
    is_primary_key:boolean \
    is_nullable:boolean \
    is_unique:boolean \
    deleted:boolean \
    deleted_at:utc_datetime
