#!/usr/bin/env bash

mix phx.gen.context ConstraintColumns ConstraintColumn constraint_columns \
    table_column_id:references:table_columns \
    constraint_id:references:constraints \
    placeholder_symbol:string