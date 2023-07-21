#!/usr/bin/env bash

mix phx.gen.context ProjectDatabases ProjectDatabase project_databases \
    project_id:references:projects \
    name:string \
    description:text \
    deleted:boolean \
    deleted_at:utc_datetime