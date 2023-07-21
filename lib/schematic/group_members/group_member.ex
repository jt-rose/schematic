defmodule Schematic.GroupMembers.GroupMember do
  use Ecto.Schema
  import Ecto.Changeset

  schema "group_members" do
    field :active, :boolean, default: false
    field :permissions, Ecto.Enum, values: [:"owner,admin,member,read-only"]
    field :group_id, :id
    field :member_id, :id

    timestamps()
  end

  @doc false
  def changeset(group_member, attrs) do
    group_member
    |> cast(attrs, [:active, :permissions])
    |> validate_required([:active, :permissions])
  end
end
