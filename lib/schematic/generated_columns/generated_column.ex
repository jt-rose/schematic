defmodule Schematic.GeneratedColumns.GeneratedColumn do
  use Ecto.Schema
  import Ecto.Changeset

  alias Schematic.DatabaseTables.DatabaseTable
  alias Schematic.GeneratedColumns.GeneratedInput

  schema "generated_columns" do
    field :column_name, :string
    field :description, :string
    field :seq_order, :integer
    field :generation_expression, :string

    belongs_to :database_table, DatabaseTable
    has_many :generated_inputs, GeneratedInput

    timestamps()
  end

  @doc false
  def changeset(generated_column, attrs) do
    generated_column
    |> cast(attrs, [
      :column_name,
      :seq_order,
      :description,
      :generation_expression,
      :database_table_id
    ])
    |> validate_required([:column_name, :seq_order, :generation_expression, :database_table_id])
  end
end
