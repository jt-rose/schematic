defmodule Schematic.DatabaseTables.DatabaseTable do
  use Ecto.Schema
  import Ecto.Changeset

  schema "database_tables" do
    field :name, :string
    field :description, :string
    field :deleted, :boolean, default: false
    field :deleted_at, :utc_datetime

    belongs_to :project_database, Schematic.ProjectDatabases.ProjectDatabase
    has_many :table_columns, Schematic.TableColumns.TableColumn
    has_many :constraints, Schematic.Constraints.Constraint

    timestamps()
  end

  @doc false
  def changeset(database_table, attrs) do
    database_table
    |> cast(attrs, [:name, :description, :deleted, :deleted_at, :project_database_id])
    |> validate_required([:name, :project_database_id])
  end
end
