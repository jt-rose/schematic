#!/usr/bin/env bash

mix phx.gen.context DatabaseTables DatabaseTable database_tables \
    project_database_id:references:project_databases \
    name:string \
    description:text \
    grid_column_start:integer \
    grid_row_start:integer \
    grid_width:enum:normal:wide \
    deleted:boolean \
    deleted_at:utc_datetime