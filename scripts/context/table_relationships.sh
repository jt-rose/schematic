#!/usr/bin/env bash

mix phx.gen.context TableRelationships TableRelationship table_relationships \
    primary_key_column_id:references:table_columns \
    foreign_key_column_id:references:table_columns \
    on_delete:enum:restrict:cascade:no_action:set_null