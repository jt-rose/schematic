defmodule Schematic.Repo.Migrations.CreateGroups do
  use Ecto.Migration

  def change do
    create table(:groups) do
      add :name, :string, null: false
      add :description, :text
      add :deleted, :boolean, default: false, null: false
      add :deleted_at, :utc_datetime
      add :public, :boolean, default: false, null: false
      add :active, :boolean, default: false, null: false
      add :owner_id, references(:users, on_delete: :nilify_all)

      timestamps()
    end

    create index(:groups, [:owner_id])
  end
end
