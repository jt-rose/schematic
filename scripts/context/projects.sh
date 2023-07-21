#!/usr/bin/env bash

mix phx.gen.context Projects Project projects \
    name:string \
    description:text \
    owner_id:references:users \
    group_id:references:groups \
    deleted:boolean \
    deleted_at:utc_datetime \
    public:boolean