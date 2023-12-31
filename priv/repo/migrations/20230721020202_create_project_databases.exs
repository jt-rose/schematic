defmodule Schematic.Repo.Migrations.CreateProjectDatabases do
  use Ecto.Migration

  def change do
    create table(:project_databases) do
      add :name, :string, null: false
      add :description, :text
      add :deleted, :boolean, default: false, null: false
      add :deleted_at, :utc_datetime
      add :project_id, references(:projects, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:project_databases, [:project_id])
  end
end
