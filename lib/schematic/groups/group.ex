defmodule Schematic.Groups.Group do
  use Ecto.Schema
  import Ecto.Changeset

  schema "groups" do
    field :active, :boolean, default: false
    field :name, :string
    field :public, :boolean, default: false
    field :description, :string
    field :deleted, :boolean, default: false
    field :deleted_at, :utc_datetime
    field :owner_id, :id

    timestamps()
  end

  @doc false
  def changeset(group, attrs) do
    group
    |> cast(attrs, [:name, :description, :deleted, :deleted_at, :public, :active])
    |> validate_required([:name, :description, :deleted, :deleted_at, :public, :active])
  end
end
