defmodule Schematic.Repo.Migrations.CreateGroupMembers do
  use Ecto.Migration

  def change do
    create table(:group_members) do
      add :active, :boolean, default: false, null: false
      add :permissions, :string, null: false
      add :group_id, references(:groups, on_delete: :delete_all)
      add :member_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create index(:group_members, [:group_id])
    create index(:group_members, [:member_id])
  end
end
