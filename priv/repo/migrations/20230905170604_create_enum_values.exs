defmodule Schematic.Repo.Migrations.CreateEnumValues do
  use Ecto.Migration

  def change do
    create table(:enum_values) do
      add :value, :string, null: false
      add :database_enum_id, references(:database_enums, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:enum_values, [:database_enum_id])
  end
end
