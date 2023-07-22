defmodule Schematic.Projects.Project do
  use Ecto.Schema
  import Ecto.Changeset

  schema "projects" do
    field :name, :string
    field :public, :boolean, default: false
    field :description, :string
    field :deleted, :boolean, default: false
    field :deleted_at, :utc_datetime
    field :owner_id, :id
    field :group_id, :id

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:name, :description, :deleted, :deleted_at, :public])
    |> validate_required([:name, :description, :public])
  end
end
