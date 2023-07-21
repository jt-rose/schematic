#!/usr/bin/env bash

mix phx.gen.context Groups Group groups \
    name:string \
    description:text \
    owner_id:references:users \
    deleted:boolean \
    deleted_at:utc_datetime \
    public:boolean \
    active:boolean