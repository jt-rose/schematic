defmodule Schematic.GeneratedColumns.GeneratedInput do
  use Ecto.Schema
  import Ecto.Changeset

  alias Schematic.TableColumns.TableColumn
  alias Schematic.GeneratedColumns.GeneratedColumn

  schema "generated_inputs" do
    field :placeholder_symbol, :string

    belongs_to :table_column, TableColumn
    belongs_to :generated_column, GeneratedColumn

    timestamps()
  end

  @doc false
  def changeset(generated_input, attrs) do
    generated_input
    |> cast(attrs, [:placeholder_symbol, :table_column_id, :generated_column_id])
    |> validate_required([:placeholder_symbol, :table_column_id, :generated_column_id])
  end
end
