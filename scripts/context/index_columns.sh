#!/usr/bin/env bash

mix phx.gen.context IndexColumns IndexColumn index_columns \
    table_column_id:references:table_columns \
    table_index_id:references:table_indexes