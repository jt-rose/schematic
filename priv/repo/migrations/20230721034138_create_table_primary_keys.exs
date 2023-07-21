defmodule Schematic.Repo.Migrations.CreateTablePrimaryKeys do
  use Ecto.Migration

  def change do
    create table(:table_primary_keys) do
      add :database_table_id, references(:database_tables, on_delete: :delete_all)
      add :table_column_id, references(:table_columns, on_delete: :delete_all)

      timestamps()
    end

    create unique_index(:table_primary_keys, [:database_table_id, :table_column_id],
             name: :unique_table_and_column_constraint
           )
  end
end
