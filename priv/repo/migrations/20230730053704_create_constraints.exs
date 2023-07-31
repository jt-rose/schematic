defmodule Schematic.Repo.Migrations.CreateConstraints do
  use Ecto.Migration

  def change do
    create table(:constraints) do
      add :name, :string
      add :description, :text
      add :check_expression, :string, null: false
      add :database_table_id, references(:database_tables, on_delete: :delete_all)

      timestamps()
    end

    create index(:constraints, [:table_id])
  end
end
