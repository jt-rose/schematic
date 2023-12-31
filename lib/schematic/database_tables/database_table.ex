defmodule Schematic.DatabaseTables.DatabaseTable do
  use Ecto.Schema
  import Ecto.Changeset

  alias Schematic.Projects.ProjectDatabase
  alias Schematic.TableColumns.TableColumn
  alias Schematic.GeneratedColumns.GeneratedColumn
  alias Schematic.DatabaseEnums.EnumColumn
  alias Schematic.Constraints.Constraint
  alias Schematic.TableIndexes.TableIndex
  alias Schematic.Triggers.SqlTrigger

  schema "database_tables" do
    field :name, :string
    field :description, :string
    field :grid_column_start, :integer
    field :grid_row_start, :integer
    field :grid_width, :string, default: "normal"
    field :deleted, :boolean, default: false
    field :deleted_at, :utc_datetime

    belongs_to :project_database, ProjectDatabase
    has_many :table_columns, TableColumn
    has_many :generated_columns, GeneratedColumn
    has_many :enum_columns, EnumColumn
    has_many :constraints, Constraint
    has_many :table_indexes, TableIndex
    has_many :triggers, SqlTrigger

    # TODO: many to many for index_columns?

    timestamps()
  end

  @doc false
  def changeset(database_table, attrs) do
    database_table
    |> cast(attrs, [
      :name,
      :description,
      :grid_column_start,
      :grid_row_start,
      :grid_width,
      :deleted,
      :deleted_at,
      :project_database_id
    ])
    |> validate_required([:name, :grid_column_start, :grid_row_start, :project_database_id])
  end
end
