defmodule Schematic.Repo.Migrations.CreateEnumColumns do
  use Ecto.Migration

  def change do
    create table(:enum_columns) do
      add :column_name, :string, null: false
      add :description, :text
      add :array_depth, :integer, null: false, default: 0
      add :is_primary_key, :boolean, default: false, null: false
      add :is_nullable, :boolean, default: false, null: false
      add :is_unique, :boolean, default: false, null: false
      add :deleted, :boolean, default: false, null: false
      add :deleted_at, :utc_datetime
      add :database_enum_id, references(:database_enums, on_delete: :restrict), null: false
      add :database_table_id, references(:database_tables, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:enum_columns, [:database_enum_id])
    create index(:enum_columns, [:database_table_id])
  end
end
