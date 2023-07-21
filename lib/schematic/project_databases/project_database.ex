defmodule Schematic.ProjectDatabases.ProjectDatabase do
  use Ecto.Schema
  import Ecto.Changeset

  schema "project_databases" do
    field :name, :string
    field :description, :string
    field :deleted, :boolean, default: false
    field :deleted_at, :utc_datetime
    field :project_id, :id

    timestamps()
  end

  @doc false
  def changeset(project_database, attrs) do
    project_database
    |> cast(attrs, [:name, :description, :deleted, :deleted_at])
    |> validate_required([:name, :description, :deleted, :deleted_at])
  end
end
