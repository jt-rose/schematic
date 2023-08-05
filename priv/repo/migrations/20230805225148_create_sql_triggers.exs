defmodule Schematic.Repo.Migrations.CreateSqlTriggers do
  use Ecto.Migration

  def change do
    create table(:sql_triggers) do
      add :name, :string, null: false
      add :event, :string, null: false
      add :timing, :string, null: false
      add :level, :string, null: false
      add :database_table_id, references(:database_tables, on_delete: :delete_all), null: false
      add :sql_function_id, references(:sql_functions, on_delete: :restrict), null: false

      timestamps()
    end

    create index(:sql_triggers, [:database_table_id])
    create index(:sql_triggers, [:sql_function_id])
  end
end
