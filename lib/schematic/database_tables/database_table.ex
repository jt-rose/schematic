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
    has_many :table_primary_keys, Schematic.TablePrimaryKeys.TablePrimaryKey

    timestamps()
  end

  @doc false
  def changeset(database_table, attrs) do
    database_table
    |> cast(attrs, [:name, :description, :deleted, :deleted_at])
    |> validate_required([:name, :description, :deleted, :deleted_at])
  end
end
