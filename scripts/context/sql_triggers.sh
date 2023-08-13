#!/usr/bin/env bash

mix phx.gen.context Triggers SqlTrigger sql_triggers \
    name:string \
    event:enum:insert:update:delete:truncate \
    timing:enum:before:after:instead_of \
    level:enum:row:statement \
    database_table_id:references:database_tables \
    sql_function_id:references:sql_functions \