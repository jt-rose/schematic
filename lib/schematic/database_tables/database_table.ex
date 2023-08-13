defmodule Schematic.DatabaseTables.DatabaseTable do
  use Ecto.Schema
  import Ecto.Changeset

  alias Schematic.Projects.ProjectDatabase
  alias Schematic.TableColumns.TableColumn
  alias Schematic.Constraints.Constraint
  alias Schematic.TableIndexes.TableIndex

  schema "database_tables" do
    field :name, :string
    field :description, :string
    field :deleted, :boolean, default: false
    field :deleted_at, :utc_datetime

    belongs_to :project_database, ProjectDatabase
    has_many :table_columns, TableColumn
    has_many :constraints, Constraint
    has_many :table_indexes, TableIndex

    # TODO: many to many for index_columns?

    timestamps()
  end

  @doc false
  def changeset(database_table, attrs) do
    database_table
    |> cast(attrs, [:name, :description, :deleted, :deleted_at, :project_database_id])
    |> validate_required([:name, :project_database_id])
  end
end
