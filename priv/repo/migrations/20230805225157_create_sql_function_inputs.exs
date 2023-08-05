defmodule Schematic.Repo.Migrations.CreateSqlFunctionInputs do
  use Ecto.Migration

  def change do
    create table(:sql_function_inputs) do
      add :placeholder_symbol, :string, null: false
      add :table_column_id, references(:table_columns, on_delete: :restrict), null: false
      add :sql_function_id, references(:sql_functions, on_delete: :delete_all), null: false
      add :sql_trigger_id, references(:sql_triggers, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:sql_function_inputs, [:table_column_id])
    create index(:sql_function_inputs, [:sql_function_id])
    create index(:sql_function_inputs, [:sql_trigger_id])
  end
end
