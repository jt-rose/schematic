defmodule Schematic.DatabaseEnums.DatabaseEnum do
  use Ecto.Schema
  import Ecto.Changeset
  alias Schematic.Projects.ProjectDatabase
  alias Schematic.DatabaseEnums.EnumValue
  alias Schematic.DatabaseEnums.EnumColumn

  schema "database_enums" do
    field :name, :string
    field :description, :string

    belongs_to :project_database, ProjectDatabase
    has_many :enum_values, EnumValue
    has_many :enum_columns, EnumColumn

    timestamps()
  end

  @doc false
  def changeset(database_enum, attrs) do
    database_enum
    |> cast(attrs, [:name, :description, :project_database_id])
    |> validate_required([:name, :project_database_id])
  end
end
