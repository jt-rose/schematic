defmodule Schematic.Constraints.Constraint do
  use Ecto.Schema
  import Ecto.Changeset

  alias Schematic.DatabaseTables.DatabaseTable
  alias Schematic.Constraints.ConstraintColumn

  schema "constraints" do
    field :name, :string
    field :description, :string
    field :check_expression, :string

    belongs_to :database_table, DatabaseTable
    has_many :constraint_columns, ConstraintColumn

    timestamps()
  end

  @doc false
  def changeset(constraint, attrs) do
    constraint
    |> cast(attrs, [:name, :description, :check_expression, :database_table_id])
    |> validate_required([:check_expression, :database_table_id])
  end
end
