defmodule Schematic.Projects.ProjectDatabase do
  use Ecto.Schema
  import Ecto.Changeset

  alias Schematic.Projects.Project
  alias Schematic.DatabaseTables.DatabaseTable
  alias Schematic.DatabaseEnums.DatabaseEnum
  alias Schematic.TableRelationships.TableRelationship

  schema "project_databases" do
    field :name, :string
    field :description, :string
    field :deleted, :boolean, default: false
    field :deleted_at, :utc_datetime

    belongs_to :project, Project, foreign_key: :project_id
    has_many :database_tables, DatabaseTable
    has_many :database_enums, DatabaseEnum
    has_many :table_relationships, TableRelationship, foreign_key: :project_database_id

    timestamps()
  end

  @doc false
  def changeset(project_database, attrs) do
    project_database
    |> cast(attrs, [:name, :description, :deleted, :deleted_at, :project_id])
    |> validate_required([:name, :project_id])
  end
end
