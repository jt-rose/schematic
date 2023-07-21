#!/usr/bin/env bash

mix phx.gen.context DatabaseTables DatabaseTable database_tables \
    project_database_id:references:project_databases \
    name:string \
    description:text \
    deleted:boolean \
    deleted_at:utc_datetime