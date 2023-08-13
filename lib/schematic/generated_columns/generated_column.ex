defmodule Schematic.GeneratedColumns.GeneratedColumn do
  use Ecto.Schema
  import Ecto.Changeset

  alias Schematic.DatabaseTables.DatabaseTable
  alias Schematic.GeneratedColumns.GeneratedInput

  schema "generated_columns" do
    field :name, :string
    field :description, :string
    field :generation_expression, :string

    belongs_to :database_table, DatabaseTable
    has_many :generated_inputs, GeneratedInput

    timestamps()
  end

  @doc false
  def changeset(generated_column, attrs) do
    generated_column
    |> cast(attrs, [:name, :description, :generation_expression, :database_table_id])
    |> validate_required([:name, :generation_expression, :database_table_id])
  end
end
