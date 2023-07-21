defmodule Schematic.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :name, :string, null: false
      add :description, :text
      add :deleted, :boolean, default: false, null: false
      add :deleted_at, :utc_datetime
      add :public, :boolean, default: false, null: false
      add :owner_id, references(:users, on_delete: :nilify_all)
      add :group_id, references(:groups, on_delete: :nilify_all)

      timestamps()
    end

    create index(:projects, [:owner_id])
    create index(:projects, [:group_id])
  end
end
