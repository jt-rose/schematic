defmodule Schematic.SqlFunctionInputs.SqlFunctionInput do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sql_function_inputs" do
    field :placeholder_symbol, :string

    belongs_to :table_column, Schematic.TableColumns.TableColumn
    belongs_to :sql_function, Schematic.SqlFunctions.SqlFunction
    belongs_to :sql_trigger, Schematic.SqlTriggers.SqlTrigger

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
