defmodule Schematic.Queries do
  import Ecto.Query, warn: false
  alias Schematic.Repo
  alias Schematic.Projects.Project
  alias Schematic.Projects.ProjectDatabase
  alias Schematic.DatabaseTables.DatabaseTable

  def list_projects_with_databases(user_id) do
    Repo.all(
      from project in Project,
        where: project.owner_id == ^user_id,
        left_join: dbs in assoc(project, :project_databases),
        preload: [project_databases: dbs]
    )
  end

  def list_db_tables(db_id) do
    Repo.all(
      from db in ProjectDatabase,
        where: db.id == ^db_id,
        left_join: tables in assoc(db, :database_tables),
        left_join: enums in assoc(db, :database_enums),
        left_join: enum_values in assoc(enums, :enum_values),
        left_join: columns in assoc(tables, :table_columns),
        left_join: gc in assoc(tables, :generated_columns),
        left_join: enum_col in assoc(tables, :enum_columns),
        left_join: cons in assoc(tables, :constraints),
        left_join: idx in assoc(tables, :table_indexes),
        left_join: tr in assoc(tables, :triggers),
        left_join: sql_func in assoc(tr, :sql_function),
        left_join: sql_func_inputs in assoc(tr, :sql_function_inputs),
        preload: [
          database_tables:
            {tables,
             table_columns: columns,
             generated_columns: gc,
             enum_columns: enum_col,
             constraints: cons,
             table_indexes: idx,
             triggers: {tr, sql_function: sql_func, sql_function_inputs: sql_func_inputs}},
          database_enums: {enums, enum_values: enum_values}
          # partitions
        ]
    )
  end

  def list_table_features(table_ids) do
    Repo.all(
      from tb in DatabaseTable,
        where: tb.id in ^table_ids,
        preload: [
          :table_columns,
          # TODO: below is poorly optimized
          enum_columns: [database_enum: :enum_values],
          # database_enums: :enum_values,
          generated_columns: :generated_inputs,
          constraints: :constraint_columns,
          table_indexes: :index_columns,
          triggers: [:sql_function, :sql_function_inputs]
        ]
    )
  end
end
