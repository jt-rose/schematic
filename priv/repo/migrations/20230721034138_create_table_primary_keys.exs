defmodule Schematic.Repo.Migrations.CreateTablePrimaryKeys do
  use Ecto.Migration

  def change do
    create table(:table_primary_keys) do
      add :database_table_id, references(:database_tables, on_delete: :delete_all)
      add :table_column_id, references(:table_columns, on_delete: :delete_all)

      timestamps()
    end

    # a unique constraint for table IDs will not be used
    # to allow for composite primary keys
    create unique_index(:table_primary_keys, [:table_column_id],
             name: :unique_column_id_constraint
           )
  end
end
