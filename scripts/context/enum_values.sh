#!/usr/bin/env bash

mix phx.gen.context DatabaseEnums EnumValues enum_values \
    database_enum_id:references:database_enums \
    value:string 