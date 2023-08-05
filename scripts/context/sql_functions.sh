#!/usr/bin/env bash

mix phx.gen.context SqlFunctions SqlFunction sql_functions \
    name:string \
    language:enum:pgsql:tcl:perl:python \
    function_code:text \
    project_database_id:references:project_databases