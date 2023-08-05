defmodule Schematic.Repo.Migrations.CreateSqlFunctions do
  use Ecto.Migration

  def change do
    create table(:sql_functions) do
      add :name, :string, null: false
      add :language, :string, null: false
      add :function_code, :text, null: false

      add :project_database_id, references(:project_databases, on_delete: :delete_all),
        null: false

      timestamps()
    end

    create index(:sql_functions, [:project_database_id])
  end
end
