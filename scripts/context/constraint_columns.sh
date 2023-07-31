#!/usr/bin/env bash

mix phx.gen.context ConstraintColumns ConstraintColumn constraint_columns \
    table_column_id:references:table_columns \
    constraint_id:references:constraints \
    placeholder_symbol:string

# inline check?
# "check $val1 < $val2",
# how to ref values in UI and retain connection to specified columns
# check for col_names in current table, highlight once valid, warn when invalid
