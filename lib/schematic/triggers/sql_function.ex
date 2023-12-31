defmodule Schematic.Triggers.SqlFunction do
  use Ecto.Schema
  import Ecto.Changeset

  alias Schematic.Projects.ProjectDatabase
  alias Schematic.Triggers.SqlFunctionInput
  alias Schematic.Triggers.SqlTrigger

  schema "sql_functions" do
    field :name, :string
    field :language, Ecto.Enum, values: [:pgsql, :tcl, :perl, :python]
    field :function_code, :string

    belongs_to :project_database, ProjectDatabase
    has_many :sql_function_inputs, SqlFunctionInput
    has_many :sql_triggers, SqlTrigger

    timestamps()
  end

  @doc false
  def changeset(sql_function, attrs) do
    sql_function
    |> cast(attrs, [:name, :language, :function_code, :project_database_id])
    |> validate_required([:name, :language, :function_code, :project_database_id])
  end
end
