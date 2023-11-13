#!/usr/bin/env bash

mix phx.gen.context DatabaseEnums DatabaseEnum database_enums \
    project_database_id:references:project_databases \
    name:string \
    description:text