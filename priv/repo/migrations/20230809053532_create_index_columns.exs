defmodule Schematic.Repo.Migrations.CreateIndexColumns do
  use Ecto.Migration

  def change do
    create table(:index_columns) do
      add :table_column_id, references(:table_columns, on_delete: :restrict), null: false
      add :table_index_id, references(:table_indexes, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:index_columns, [:table_column_id])
    create index(:index_columns, [:table_index_id])
  end
end
