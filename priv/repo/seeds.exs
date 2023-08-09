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

import Ecto.Query, warn: false

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

alias Schematic.TableRelationships
alias Schematic.TableRelationships.TableRelationship

alias Schematic.Constraints
alias Schematic.Constraints.Constraint

alias Schematic.ConstraintColumns
alias Schematic.ConstraintColumns.ConstraintColumn

alias Schematic.GeneratedColumns
alias Schematic.GeneratedColumns.GeneratedColumn

alias Schematic.GeneratedInputs
alias Schematic.GeneratedInputs.GeneratedInput

alias Schematic.SqlFunctions
alias Schematic.SqlFunctions.SqlFunction

alias Schematic.SqlTriggers
alias Schematic.SqlTriggers.SqlTrigger

alias Schematic.SqlFunctionInputs
alias Schematic.SqlFunctionInputs.SqlFunctionInput

alias Schematic.TableIndexes
alias Schematic.TableIndexes.TableIndex

alias Schematic.IndexColumns
alias Schematic.IndexColumns.IndexColumn

# clear previous data
Repo.delete_all(IndexColumn)
Repo.delete_all(TableIndex)
Repo.delete_all(SqlFunctionInput)
Repo.delete_all(SqlTrigger)
Repo.delete_all(SqlFunction)
Repo.delete_all(GeneratedInput)
Repo.delete_all(GeneratedColumn)
Repo.delete_all(Constraint)
Repo.delete_all(ConstraintColumn)
Repo.delete_all(TableRelationship)
Repo.delete_all(TableColumn)
Repo.delete_all(DatabaseTable)
Repo.delete_all(ProjectDatabase)
Repo.delete_all(Project)
Repo.delete_all(GroupMember)
Repo.delete_all(Group)
Repo.delete_all(User)

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
{:ok, demo_db} =
  ProjectDatabases.create_project_database(%{
    name: "demo-db",
    description: "a database used for demoing schematic",
    project_id: demo_project.id
  })

IO.puts("Generated demo-database")

# add tables to database
{:ok, authors_table} =
  Repo.insert(%DatabaseTable{
    name: "authors",
    description: "authors past and present",
    project_database_id: demo_db.id
  })

{:ok, books_table} =
  Repo.insert(%DatabaseTable{
    name: "writings",
    description: "books, essays, and poems",
    project_database_id: demo_db.id
  })

# add columns to authors table
{:ok, author_table_pk} =
  Repo.insert(%TableColumn{
    data_type: "SERIAL",
    column_name: "id",
    is_primary_key: true,
    is_unique: true,
    # TODO: add check for primary key and enforce unique
    database_table_id: authors_table.id
  })

{:ok, author_name} =
  Repo.insert(%TableColumn{
    data_type: "VARCHAR(255)",
    column_name: "name",
    description: "author's first and last name",
    database_table_id: authors_table.id
  })

{:ok, author_birthyear} =
  Repo.insert(%TableColumn{
    data_type: "DATETIME",
    column_name: "birthyear",
    is_nullable: true,
    database_table_id: authors_table.id
  })

# used for testing the check function
{:ok, author_first_edition_sales} =
  Repo.insert(%TableColumn{
    data_type: "INTEGER",
    column_name: "first_edition_sales",
    database_table_id: authors_table.id
  })

{:ok, author_total_sales} =
  Repo.insert(%TableColumn{
    data_type: "INTEGER",
    column_name: "total_sales",
    database_table_id: authors_table.id
  })

{:ok, author_country} =
  Repo.insert(%TableColumn{
    data_type: "VARCHAR(255)",
    column_name: "country_of_birth",
    is_nullable: true,
    database_table_id: authors_table.id
  })

# add columns to books table
{:ok, books_table_pk} =
  Repo.insert(%TableColumn{
    data_type: "SERIAL",
    column_name: "id",
    is_primary_key: true,
    is_unique: true,
    # TODO: add check for primary key and enforce unique
    database_table_id: books_table.id
  })

{:ok, book_title} =
  Repo.insert(%TableColumn{
    data_type: "VARCHAR(255)",
    column_name: "title",
    database_table_id: books_table.id
  })

{:ok, book_edition} =
  Repo.insert(%TableColumn{
    data_type: "INTEGER",
    column_name: "edition",
    database_table_id: books_table.id
  })

{:ok, book_publication_year} =
  Repo.insert(%TableColumn{
    data_type: "DATETIME",
    column_name: "publication_year",
    is_nullable: true,
    database_table_id: books_table.id
  })

{:ok, book_author} =
  Repo.insert(%TableColumn{
    data_type: "FOREIGN_KEY",
    column_name: "author_id",
    database_table_id: books_table.id
  })

# add table relationships
{:ok, books_to_authors_fk} =
  Repo.insert(%TableRelationship{
    primary_key_column_id: author_table_pk.id,
    foreign_key_column_id: book_author.id,
    on_delete: :cascade,
    on_update: :no_action
  })

# add options to columns
# TODO

# {:ok, result} =
#   Repo.all(
#     from p in Project,
#       join: project_dbs in assoc(p, :project_databases),
#       join: db_tables in assoc(project_dbs, :database_tables),
#       join: columns in assoc(db_tables, :table_columns),
#       join: ref_by in assoc(columns, :referenced_by),
#       join: ref_to in assoc(columns, :references),
#       preload: [
#         project_databases:
#           {project_dbs,
#            database_tables:
#              {db_tables, table_columns: {columns, referenced_by: ref_by, references: ref_to}}}
#       ]
#   )
result =
  Repo.all(
    from p in Project,
      preload: [
        :owner,
        group: :members,
        project_databases: [database_tables: :table_columns]
      ]
  )

IO.puts("INSERTED:")
IO.inspect(result)

[rels] = Repo.all(TableRelationship)

IO.puts(
  "Primary Key #{rels.primary_key_column_id} related to Foreign Key #{rels.foreign_key_column_id} with on_delete policy: #{rels.on_delete}"
)

# insert constraints
Repo.insert(%Constraint{
  check_expression: "1234-5678-uuid >= 9876-5432-uuid",
  database_table: authors_table,
  description: "",
  constraint_columns: [
    %ConstraintColumn{
      placeholder_symbol: "1234-5678-uuid",
      table_column: author_first_edition_sales
    },
    %ConstraintColumn{
      placeholder_symbol: "9876-5432-uuid",
      table_column: author_total_sales
    }
  ]
})

result =
  Repo.all(
    from c in Constraint,
      preload: [constraint_columns: :table_column]
  )

IO.puts("INSERTED:")
IO.inspect(result)

# set up sql-generated data
Repo.insert(%GeneratedColumn{
  database_table: authors_table,
  description: "total sales for second editions onwards",
  name: "author_post_first_edition_sales",
  generation_expression: "123-uuid-456 - 456-uuid-789",
  generated_inputs: [
    %GeneratedInput{
      placeholder_symbol: "123-uuid-456",
      table_column: author_total_sales
    },
    %GeneratedInput{
      placeholder_symbol: "456-uuid-789",
      table_column: author_first_edition_sales
    }
  ]
})

result =
  Repo.all(
    from g in GeneratedColumn,
      preload: [generated_inputs: :table_column]
  )

IO.puts("INSERTED:")
IO.inspect(result)

# create sql functions
{:ok, trim_whitespace_fn} =
  Repo.insert(%SqlFunction{
    name: "trim_whitespace",
    language: :pgsql,
    function_code: "
  CREATE OR REPLACE FUNCTION trim_whitespace()
  RETURNS TRIGGER
  LANGUAGE PLPGSQL
  AS
$$
BEGIN
NEW.uuid-45-67-89 = LTRIM(NEW.uuid-45-67-89);
RETURN NEW;
END;
$$
  ",
    project_database: demo_db
  })

# create sql triggers with function inputs
{:ok, insert_author_trigger} =
  Repo.insert(%SqlTrigger{
    database_table: authors_table,
    event: :insert,
    level: :row,
    name: "trim_whitespace_on_author's_name",
    sql_function: trim_whitespace_fn,
    timing: :before,
    sql_function_inputs: [
      %SqlFunctionInput{
        placeholder_symbol: "uuid-45-67-89",
        sql_function: trim_whitespace_fn,
        table_column: author_name
      }
    ]
  })

result =
  Repo.all(
    from trigger in SqlTrigger,
      preload: [:sql_function, :sql_function_inputs]
  )

IO.puts("INSERTED:")
IO.inspect(result)

# insert multicolumn indexes
{:ok, unique_title_edition_index} =
  Repo.insert(%TableIndex{
    is_unique: true,
    database_table: books_table,
    index_columns: [
      %IndexColumn{
        table_column: book_title
      },
      %IndexColumn{
        table_column: book_edition
      }
    ]
  })

result =
  Repo.all(
    from mc_idx in TableIndex,
      preload: [:database_table, index_columns: :table_column]
  )

IO.puts("INSERTED:")
IO.inspect(result)
