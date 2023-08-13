defmodule Schematic.Triggers.SqlFunctionInput do
  use Ecto.Schema
  import Ecto.Changeset

  alias Schematic.TableColumns.TableColumn
  alias Schematic.Triggers.SqlFunction
  alias Schematic.Triggers.SqlTrigger

  schema "sql_function_inputs" do
    field :placeholder_symbol, :string

    belongs_to :table_column, TableColumn
    belongs_to :sql_function, SqlFunction
    belongs_to :sql_trigger, SqlTrigger

    timestamps()
  end

  @doc false
  def changeset(sql_function_input, attrs) do
    sql_function_input
    |> cast(attrs, [:placeholder_symbol, :table_column_id, :sql_function_id, :sql_trigger_id])
    |> validate_required([
      :placeholder_symbol,
      :table_column_id,
      :sql_function_id,
      :sql_trigger_id
    ])
  end
end
