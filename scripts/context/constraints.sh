#!/usr/bin/env bash

mix phx.gen.context Constraints Constraint constraints \
    database_table_id:references:database_tables \
    name:string \
    description:text \
    check_expression:string