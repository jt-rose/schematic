defmodule Schematic.Repo.Migrations.CreateConstraintColumns do
  use Ecto.Migration

  def change do
    create table(:constraint_columns) do
      add :placeholder_symbol, :string, null: false
      add :table_column_id, references(:table_columns, on_delete: :restrict), null: false
      add :constraint_id, references(:constraints, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:constraint_columns, [:table_column_id])
    create index(:constraint_columns, [:constraint_id])
  end
end
