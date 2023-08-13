defmodule Schematic.Constraints.ConstraintColumn do
  use Ecto.Schema
  import Ecto.Changeset

  alias Schematic.TableColumns.TableColumn
  alias Schematic.Constraints.Constraint

  schema "constraint_columns" do
    field :placeholder_symbol, :string

    belongs_to :table_column, TableColumn
    belongs_to :constraint, Constraint

    timestamps()
  end

  @doc false
  def changeset(constraint_column, attrs) do
    constraint_column
    |> cast(attrs, [:placeholder_symbol, :table_column_id, :constraint_id])
    |> validate_required([:placeholder_symbol, :table_column_id, :constraint_id])
  end
end
