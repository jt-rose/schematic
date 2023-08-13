defmodule Schematic.Projects.Project do
  use Ecto.Schema
  import Ecto.Changeset

  alias Schematic.Accounts.User
  alias Schematic.Groups.Group
  alias Schematic.Projects.ProjectDatabase

  schema "projects" do
    field :name, :string
    field :public, :boolean, default: false
    field :description, :string
    field :deleted, :boolean, default: false
    field :deleted_at, :utc_datetime

    belongs_to :owner, User, foreign_key: :owner_id
    belongs_to :group, Group

    has_many :project_databases, ProjectDatabase, foreign_key: :project_id

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:name, :description, :deleted, :deleted_at, :public, :owner_id, :group_id])
    |> validate_required([:name])
  end

  # TODO: if owner deletes account but other members still present, transfer ownership
  # TODO: otherwise, delete project(s)
end
