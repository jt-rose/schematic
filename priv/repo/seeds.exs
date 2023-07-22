# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Schematic.Repo.insert!(%Schematic.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Schematic.Repo
alias Schematic.Accounts
alias Schematic.Accounts.User

# register users
Repo.delete_all(User)
Accounts.register_user(%{email: "jr@example.com", password: "Secret123!!!"})
Accounts.register_user(%{email: "jameson@example.com", password: "Secret123!!!"})
Accounts.register_user(%{email: "nathan@example.com", password: "Secret123!!!"})

users = Repo.all(User)

IO.puts("Registered #{length(users)} of expected 3 users")
