defmodule Schematic.Repo.Migrations.CreateDatabaseTables do
  use Ecto.Migration

  def change do
    create table(:database_tables) do
      add :name, :string, null: false
      add :description, :text
      add :deleted, :boolean, default: false, null: false
      add :deleted_at, :utc_datetime

      add :project_database_id, references(:project_databases, on_delete: :delete_all),
        null: false

      timestamps()
    end

    create index(:database_tables, [:project_database_id])
  end
end
