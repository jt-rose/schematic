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

alias Schematic.TableRelationships
alias Schematic.Repo

alias Schematic.Accounts
alias Schematic.Accounts.User

alias Schematic.Projects
alias Schematic.Projects.Project
alias Schematic.Projects.ProjectDatabase

alias Schematic.Groups
alias Schematic.Groups.Group
alias Schematic.Groups.GroupMember

alias Schematic.DatabaseTables.DatabaseTable

alias Schematic.TableColumns.TableColumn
alias Schematic.TableColumns.Config

alias Schematic.TableRelationships.TableRelationship

alias Schematic.Constraints.Constraint
alias Schematic.Constraints.ConstraintColumn

alias Schematic.GeneratedColumns.GeneratedColumn
alias Schematic.GeneratedColumns.GeneratedInput

alias Schematic.Triggers.SqlTrigger
alias Schematic.Triggers.SqlFunction
alias Schematic.Triggers.SqlFunctionInput

alias Schematic.TableIndexes.TableIndex
alias Schematic.TableIndexes.IndexColumn

alias Schematic.DatabaseEnums
alias DatabaseEnums.DatabaseEnum
alias DatabaseEnums.EnumValue
alias DatabaseEnums.EnumColumn

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
  Groups.create_group_member(%{
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
  Projects.create_project_database(%{
    name: "demo-db",
    description: "a database used for demoing schematic",
    project_id: demo_project.id
  })

IO.puts("Generated demo-database")

# add database enums

{:ok, season_enum} =
  DatabaseEnums.create_database_enum(%{
    project_database: demo_db,
    name: "seasons",
    enum_values: [
      %EnumValue{
        value: "spring"
      },
      %EnumValue{
        value: "summer"
      },
      %EnumValue{
        value: "winter"
      },
      %EnumValue{
        value: "fall"
      }
    ]
  })

# TODO: defaults?
# TODO: query result

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
    config: %Config.Simple{
      data_type: "SERIAL"
      # __type__: "simple"
    },
    # data_type: "SERIAL",
    column_name: "id",
    is_primary_key: true,
    is_unique: true,
    # TODO: add check for primary key and enforce unique
    database_table_id: authors_table.id
  })

{:ok, author_name} =
  Repo.insert(%TableColumn{
    config: %Config.Amount{
      data_type: "VARCHAR",
      amount: 255
      # __type__: "amount"
    },
    # data_type: "VARCHAR(255)",
    column_name: "name",
    description: "author's first and last name",
    database_table_id: authors_table.id
  })

{:ok, author_birthyear} =
  Repo.insert(%TableColumn{
    # data_type: "DATETIME",
    config: %Config.Simple{
      data_type: "DATETIME"
      # __type__: "simple"
    },
    column_name: "birthyear",
    is_nullable: true,
    database_table_id: authors_table.id
  })

# used for testing the check function
{:ok, author_first_edition_sales} =
  Repo.insert(%TableColumn{
    # data_type: "INTEGER",
    config: %Config.Simple{
      data_type: "INTEGER"
      # __type__: "simple"
    },
    column_name: "first_edition_sales",
    database_table_id: authors_table.id
  })

{:ok, author_total_sales} =
  Repo.insert(%TableColumn{
    # data_type: "INTEGER",
    config: %Config.Simple{
      data_type: "INTEGER"
      # __type__: "simple"
    },
    column_name: "total_sales",
    database_table_id: authors_table.id
  })

{:ok, author_country} =
  Repo.insert(%TableColumn{
    # data_type: "VARCHAR(255)",
    config: %Config.Amount{
      data_type: "VARCHAR",
      amount: 255
      # __type__: "amount"
    },
    column_name: "country_of_birth",
    is_nullable: true,
    database_table_id: authors_table.id
  })

# add columns to books table
{:ok, books_table_pk} =
  Repo.insert(%TableColumn{
    # data_type: "SERIAL",
    config: %Config.Simple{
      data_type: "SERIAL"
      # __type__: "simple"
    },
    column_name: "id",
    is_primary_key: true,
    is_unique: true,
    # TODO: add check for primary key and enforce unique
    database_table_id: books_table.id
  })

{:ok, book_title} =
  Repo.insert(%TableColumn{
    # data_type: "VARCHAR(255)",
    config: %Config.Amount{
      data_type: "VARCHAR",
      amount: 255
      # __type__: "amount"
    },
    column_name: "title",
    database_table_id: books_table.id
  })

{:ok, book_edition} =
  Repo.insert(%TableColumn{
    # data_type: "INTEGER",
    config: %Config.Simple{
      data_type: "INTEGER"
      # __type__: "simple"
    },
    column_name: "edition",
    database_table_id: books_table.id
  })

{:ok, book_publication_year} =
  Repo.insert(%TableColumn{
    # data_type: "DATETIME",
    config: %Config.Simple{
      data_type: "DATETIME"
      # __type__: "simple"
    },
    column_name: "publication_year",
    is_nullable: true,
    database_table_id: books_table.id
  })

{:ok, book_author} =
  Repo.insert(%TableColumn{
    # data_type: "FOREIGN_KEY",
    config: %Config.Simple{
      data_type: "FOREIGN KEY"
      # __type__: "simple"
    },
    column_name: "author_id",
    database_table_id: books_table.id
  })

# add enum column
{:ok, book_release_season} =
  Repo.insert(%EnumColumn{
    database_enum: season_enum,
    database_table: books_table,
    column_name: "release_season"
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

IO.puts("TESTING BIG QUERY")
IO.inspect(authors_table.id)

# columns =
#   Repo.all(
#     from tb in DatabaseTable,
#       where: tb.id == ^authors_table.id,
#       preload: [
#         :table_columns,
#         generated_columns: :generated_inputs,
#         constraints: :constraint_columns,
#         table_indexes: :index_columns,
#         triggers: [:sql_function, :sql_function_inputs]
#       ]
#   )

columns =
  Repo.all(
    from tb in DatabaseTable,
      where: tb.id == ^authors_table.id,
      join: c in TableColumn,
      on: c.database_table_id == tb.id,
      join: gc in assoc(tb, :generated_columns),
      join: cons in assoc(tb, :constraints),
      join: idx in assoc(tb, :table_indexes),
      join: tr in assoc(tb, :triggers)
    # preload: [
    #   :table_columns,
    #   generated_columns: :generated_inputs,
    #   constraints: :constraint_columns,
    #   table_indexes: :index_columns,
    #   triggers: [:sql_function, :sql_function_inputs]
    # ]
  )

# indexes =
#   Repo.all(
#     from mc_idx in TableIndex,
#       # where:
#       preload: [:index_columns]
#   )

# rels =
#   Repo.all(
#     from rel in TableRelationship,
#       # where:
#       preload: []
#   )

table_ids = Schematic.DatabaseTables.list_database_tables() |> Enum.map(fn tb -> tb.id end)

IO.puts("TEST PRELOADS:")
Schematic.Queries.list_table_features(table_ids)

IO.puts("TEST WITH JOIN / PRELOAD MIX:")
Schematic.Queries.list_table_features2(table_ids)

IO.puts("\nSeeding Complete")
