defmodule Schematic.Repo.Migrations.CreateTableColumns do
  use Ecto.Migration

  def change do
    create table(:table_columns) do
      add :column_name, :string, null: false
      add :data_type, :string
      add :description, :text
      add :deleted, :boolean, default: false, null: false
      add :deleted_at, :utc_datetime
      add :options, :map
      add :table_id, references(:database_tables, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:table_columns, [:table_id])
  end
end