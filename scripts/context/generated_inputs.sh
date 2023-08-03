#!/usr/bin/env bash

mix phx.gen.context GeneratedInputs GeneratedInput generated_inputs \
    table_column_id:references:table_columns \
    generated_column_id:references:generated_columns \
    placeholder_symbol:string