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

alias Schematic.Projects
alias Schematic.Projects.Project

# clear previous data
Repo.delete_all(User)
Repo.delete_all(Project)

# register users
{:ok, jr} = Accounts.register_user(%{email: "jr@example.com", password: "Secret123!!!"})
_jameson = Accounts.register_user(%{email: "jameson@example.com", password: "Secret123!!!"})
_nathan = Accounts.register_user(%{email: "nathan@example.com", password: "Secret123!!!"})

users = Repo.all(User)

IO.puts("Registered #{length(users)} of expected 3 users")

# add project

{:ok, demo_project} =
  Projects.create_project(%{
    name: "demo-project",
    public: true,
    description: "a demo project for showing off schematic",
    owner_id: jr.id
  })

IO.puts("Generated demo-project")
