defmodule Schematic.Triggers.SqlTrigger do
  use Ecto.Schema
  import Ecto.Changeset

  alias Schematic.DatabaseTables.DatabaseTable
  alias Schematic.Triggers.SqlFunction
  alias Schematic.Triggers.SqlFunctionInput

  schema "sql_triggers" do
    field :name, :string
    field :level, Ecto.Enum, values: [:row, :statement]
    field :event, Ecto.Enum, values: [:insert, :update, :delete, :truncate]
    field :timing, Ecto.Enum, values: [:before, :after, :instead_of]

    belongs_to :database_table, DatabaseTable
    belongs_to :sql_function, SqlFunction
    has_many :sql_function_inputs, SqlFunctionInput

    timestamps()
  end

  @doc false
  def changeset(sql_trigger, attrs) do
    sql_trigger
    |> cast(attrs, [:name, :event, :timing, :level, :database_table_id, :sql_function_id])
    |> validate_required([:name, :event, :timing, :level, :database_table_id, :sql_function_id])
  end
end
