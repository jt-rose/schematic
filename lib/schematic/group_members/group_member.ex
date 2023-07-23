defmodule Schematic.GroupMembers.GroupMember do
  use Ecto.Schema
  import Ecto.Changeset

  schema "group_members" do
    field :active, :boolean, default: true
    field :permissions, Ecto.Enum, values: [:owner, :admin, :member, :readonly]

    belongs_to :group, Schematic.Groups.Group
    belongs_to :member, Schematic.Accounts.User, foreign_key: :member_id

    timestamps()
  end

  @doc false
  def changeset(group_member, attrs) do
    group_member
    |> cast(attrs, [:group_id, :member_id, :active, :permissions])
    |> validate_required([:active, :permissions])
  end
end
