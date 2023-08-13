#!/usr/bin/env bash

# drop and recreate DB, run migrations, and run seeding

mix ecto.drop
mix ecto.create
mix ecto.migrate
mix run priv/repo/seeds.exs