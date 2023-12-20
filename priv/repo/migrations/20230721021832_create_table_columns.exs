defmodule Schematic.Repo.Migrations.CreateTableColumns do
  use Ecto.Migration

  def change do
    create table(:table_columns) do
      add :column_name, :string, null: false
      add :seq_order, :integer, null: false
      add :config, :map
      add :description, :text
      add :array_depth, :integer, default: 0, null: false
      add :is_primary_key, :boolean, default: false, null: false
      add :is_nullable, :boolean, default: false, null: false
      add :is_unique, :boolean, default: false, null: false
      add :deleted, :boolean, default: false, null: false
      add :deleted_at, :utc_datetime
      add :database_table_id, references(:database_tables, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:table_columns, [:database_table_id])
  end
end
