defmodule Schematic.Repo.Migrations.CreateTableIndexes do
  use Ecto.Migration

  def change do
    create table(:table_indexes) do
      add :is_unique, :boolean, default: false, null: false
      add :database_table_id, references(:database_tables, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:table_indexes, [:database_table_id])
  end
end
