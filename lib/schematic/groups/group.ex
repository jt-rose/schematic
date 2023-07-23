defmodule Schematic.Groups.Group do
  use Ecto.Schema
  import Ecto.Changeset

  schema "groups" do
    field :active, :boolean, default: true
    field :name, :string
    field :public, :boolean, default: false
    field :description, :string
    field :deleted, :boolean, default: false
    field :deleted_at, :utc_datetime

    belongs_to :owner, Schematic.Accounts.User, foreign_key: :owner_id
    has_many :members, Schematic.GroupMembers.GroupMember, foreign_key: :member_id
    has_many :projects, Schematic.Projects.Project

    timestamps()
  end

  @doc false
  def changeset(group, attrs) do
    group
    |> cast(attrs, [:name, :description, :deleted, :deleted_at, :public, :active, :owner_id])
    |> validate_required([:name])
  end
end
