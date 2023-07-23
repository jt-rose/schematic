defmodule Schematic.ProjectDatabases.ProjectDatabase do
  use Ecto.Schema
  import Ecto.Changeset

  schema "project_databases" do
    field :name, :string
    field :description, :string
    field :deleted, :boolean, default: false
    field :deleted_at, :utc_datetime

    belongs_to :project, Schematic.Projects.Project, foreign_key: :project_id
    has_many :database_tables, Schematic.DatabaseTables.DatabaseTable

    timestamps()
  end

  @doc false
  def changeset(project_database, attrs) do
    project_database
    |> cast(attrs, [:name, :description, :deleted, :deleted_at, :project_id])
    |> validate_required([:name, :description, :deleted, :deleted_at, :project_id])
  end
end
