defmodule Schematic.Groups.GroupMember do
  use Ecto.Schema
  import Ecto.Changeset

  alias Schematic.Groups.Group
  alias Schematic.Accounts.User

  schema "group_members" do
    field :active, :boolean, default: true
    field :permissions, Ecto.Enum, values: [:owner, :admin, :member, :readonly]

    belongs_to :group, Group
    belongs_to :member, User, foreign_key: :member_id

    timestamps()
  end

  @doc false
  def changeset(group_member, attrs) do
    group_member
    |> cast(attrs, [:active, :permissions, :group_id, :member_id])
    |> validate_required([:active, :permissions, :group_id, :member_id])
  end
end
