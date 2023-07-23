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
      add :database_table_id, references(:database_tables, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:table_columns, [:database_table_id])
  end
end
