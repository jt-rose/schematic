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

alias Mix.Tasks.Phx.Gen.Schema
alias Schematic.Repo

alias Schematic.Accounts
alias Schematic.Accounts.User

alias Schematic.Projects
alias Schematic.Projects.Project

alias Schematic.Groups
alias Schematic.Groups.Group

alias Schematic.GroupMembers
alias Schematic.GroupMembers.GroupMember

alias Schematic.ProjectDatabases
alias Schematic.ProjectDatabases.ProjectDatabase

alias Schematic.DatabaseTables
alias Schematic.DatabaseTables.DatabaseTable

alias Schematic.TableColumns
alias Schematic.TableColumns.TableColumn

alias Schematic.TablePrimaryKeys
alias Schematic.TablePrimaryKeys.TablePrimaryKey

# clear previous data
Repo.delete_all(User)
Repo.delete_all(Project)
Repo.delete_all(GroupMember)
Repo.delete_all(Group)
Repo.delete_all(ProjectDatabase)
Repo.delete_all(DatabaseTable)
Repo.delete_all(TableColumn)
Repo.delete_all(TablePrimaryKey)

# register users
{:ok, jr} = Accounts.register_user(%{email: "jr@example.com", password: "Secret123!!!"})
{:ok, jameson} = Accounts.register_user(%{email: "jameson@example.com", password: "Secret123!!!"})
{:ok, _nathan} = Accounts.register_user(%{email: "nathan@example.com", password: "Secret123!!!"})

users = Repo.all(User)

IO.puts("Registered #{length(users)} of expected 3 users")

# add group with group member
{:ok, group} = Groups.create_group(%{owner_id: jr.id, name: "demo-group"})

{:ok, member} =
  GroupMembers.create_group_member(%{
    group_id: group.id,
    member_id: jameson.id,
    active: true,
    permissions: "member"
  })

# add project
{:ok, demo_project} =
  Projects.create_project(%{
    name: "demo-project",
    public: false,
    description: "a demo project for showing off schematic",
    owner_id: jr.id,
    group_id: group.id
  })

IO.puts("Generated demo-project")

# add database to project
{:ok, demo_db} = ProjectDatabases.create_project_database(%{
  name: "demo-db",
  description: "a database used for demoing schematic",
  project_id: demo_project.id
})

IO.puts("Generated demo-database")

# add tables to database
{:ok, authors_table}

# add column(s) to table
# add options to columns
# add primary keys
