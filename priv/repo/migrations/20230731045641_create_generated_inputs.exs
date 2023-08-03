defmodule Schematic.Repo.Migrations.CreateGeneratedInputs do
  use Ecto.Migration

  def change do
    create table(:generated_inputs) do
      add :placeholder_symbol, :string, null: false
      add :table_column_id, references(:table_columns, on_delete: :restrict), null: false

      add :generated_column_id, references(:generated_columns, on_delete: :delete_all),
        null: false

      timestamps()
    end

    create index(:generated_inputs, [:table_column_id])
    create index(:generated_inputs, [:generated_column_id])
  end
end
