defmodule Schematic.Projects.Project do
  use Ecto.Schema
  import Ecto.Changeset

  schema "projects" do
    field :name, :string
    field :public, :boolean, default: false
    field :description, :string
    field :deleted, :boolean, default: false
    field :deleted_at, :utc_datetime

    belongs_to :owner, Schematic.Accounts.User, foreign_key: :owner_id
    belongs_to :group, Schematic.Groups.Group

    has_many :project_databases, Schematic.ProjectDatabases.ProjectDatabase,
      foreign_key: :project_id

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:name, :description, :deleted, :deleted_at, :public])
    |> validate_required([:name, :description, :public])
  end
end
