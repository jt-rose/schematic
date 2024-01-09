defmodule Schematic.GeneratedColumns.GeneratedColumn do
  use Ecto.Schema
  import Ecto.Changeset

  alias Schematic.DatabaseTables.DatabaseTable
  alias Schematic.GeneratedColumns.GeneratedInput

  schema "generated_columns" do
    field :column_name, :string
    field :description, :string
    field :table_position, :integer
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
      :table_position,
      :description,
      :generation_expression,
      :database_table_id
    ])
    |> validate_required([
      :column_name,
      :table_position,
      :generation_expression,
      :database_table_id
    ])
  end
end
