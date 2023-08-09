#!/usr/bin/env bash

mix phx.gen.context TableIndexes TableIndex table_indexes \
    database_table_id:references:database_tables \
    is_unique:boolean