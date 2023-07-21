#!/usr/bin/env bash

# # NUMERIC
# POSTGRES_FIELDS=":smallint"
# POSTGRES_FIELDS+=":integer"
# POSTGRES_FIELDS+="bigint"

# POSTGRES_FIELDS+=":double precision" # (precision, scale)
# POSTGRES_FIELDS+=":real"
# POSTGRES_FIELDS+=":decimal" # (precision, scale)
# POSTGRES_FIELDS+=":numeric" # (precision, scale)

# POSTGRES_FIELDS+=":smallserial"
# POSTGRES_FIELDS+=":serial"
# POSTGRES_FIELDS+=":bigserial"

# # MONETARY
# POSTGRES_FIELDS+=":money"

# # CHARACTER
# POSTGRES_FIELDS+=":char" # (n)
# POSTGRES_FIELDS+=":varchar" # (n)
# POSTGRES_FIELDS+=":text"

# # BINARY
# POSTGRES_FIELDS+=":bytea"

# # DATE/TIME
# POSTGRES_FIELDS+=":date"
# POSTGRES_FIELDS+=":time" # P elem -> num of fractional digits in seconds field
# #POSTGRES_FIELDS+=":time with time zone" # P elem
# POSTGRES_FIELDS+=":timestamp" # P elem
# #POSTGRES_FIELDS+=":timestamp with time zone" # P elem
# POSTGRES_FIELDS+=":interval" # varying (fields, p)

# # BOOLEAN
# POSTGRES_FIELDS+=":boolean"

# # ENUM

# # GEOMETRIC
# POSTGRES_FIELDS+=":box"
# POSTGRES_FIELDS+=":circle"
# POSTGRES_FIELDS+=":line"
# POSTGRES_FIELDS+=":lseg"
# POSTGRES_FIELDS+=":path"
# POSTGRES_FIELDS+=":point"
# POSTGRES_FIELDS+=":polygon"

# # NETWORK ADDRESS
# POSTGRES_FIELDS+=":cidr"
# POSTGRES_FIELDS+=":inet"
# POSTGRES_FIELDS+=":macaddr"
# POSTGRES_FIELDS+=":macaddr8"

# # BIT STRING
# POSTGRES_FIELDS+=":bit" # (n)
# POSTGRES_FIELDS+=":bit varying" # (n)

# # TEXT SEARCH
# POSTGRES_FIELDS+=":tsquery" # generated from functions, but can be stored as type
# POSTGRES_FIELDS+=":tsvector"

# # UUID
# POSTGRES_FIELDS+=":uuid" # DEFAULT uuid_generate_v4 ()

# # XML
# POSTGRES_FIELDS+=":xml"

# # JSON
# POSTGRES_FIELDS+=":json"
# POSTGRES_FIELDS+=":jsonb"

# # ARRAY

# # RANGE

# # COMPOSITE

# # DOMAIN

# # OBJECT IDENTIFIER

# # PG_LSN
# POSTGRES_FIELDS+=":pg_lsn"

# # PSEUDO-TYPES

# # EXTRA
# POSTGRES_FIELDS+=":pg_snapshot"


# echo $POSTGRES_FIELDS

mix phx.gen.context TableColumns TableColumn table_columns \
    table_id:references:database_tables \
    column_name:string \
    data_type:string \
    description:text \
    deleted:boolean \
    deleted_at:utc_datetime \
    options:map # default, generated, foreign key, check, parameters (n, etc.), unique, nullable

# options: { default_value: 3, unique: true, foreign_key: { table: "users", column: "id" } }
