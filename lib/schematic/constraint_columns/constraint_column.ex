defmodule Schematic.ConstraintColumns.ConstraintColumn do
  use Ecto.Schema
  import Ecto.Changeset

  schema "constraint_columns" do
    field :placeholder_symbol, :string

    belongs_to :table_column, Schematic.TableColumns.TableColumn
    belongs_to :constraint, Schematic.Constraints.Constraint

    timestamps()
  end

  @doc false
  def changeset(constraint_column, attrs) do
    constraint_column
    |> cast(attrs, [:placeholder_symbol, :table_column_id, :constraint_id])
    |> validate_required([:placeholder_symbol, :table_column_id, :constraint_id])
  end
end
