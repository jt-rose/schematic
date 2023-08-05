#!/usr/bin/env bash

mix phx.gen.context SqlFunctionInputs SqlFunctionInput sql_function_inputs \
    table_column_id:references:table_columns \
    sql_function_id:references:sql_functions \
    sql_trigger_id:references:sql_triggers \
    placeholder_symbol:string