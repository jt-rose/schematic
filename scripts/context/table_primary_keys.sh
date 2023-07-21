#!/usr/bin/env bash

mix phx.gen.context TablePrimaryKeys TablePrimaryKey table_primary_keys \
    database_table_id:references:database_tables \
    table_column_id:references:table_columns