#!/usr/bin/env bash

mix phx.gen.context Groups GroupMember group_members \
    group_id:references:groups \
    member_id:references:users \
    active:boolean \
    permissions:enum:owner,admin,member,read-only
    