defmodule Schematic.Repo.Migrations.CreateGeneratedColumns do
  use Ecto.Migration

  def change do
    create table(:generated_columns) do
      add :column_name, :string, null: false
      add :table_position, :integer, null: false
      add :description, :text
      add :generation_expression, :string, null: false
      add :database_table_id, references(:database_tables, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:generated_columns, [:database_table_id])
  end
end
