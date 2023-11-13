defmodule Schematic.Repo.Migrations.CreateDatabaseEnums do
  use Ecto.Migration

  def change do
    create table(:database_enums) do
      add :name, :string, null: false
      add :description, :text

      add :project_database_id, references(:project_databases, on_delete: :delete_all),
        null: false

      timestamps()
    end

    create index(:database_enums, [:project_database_id])
  end
end
