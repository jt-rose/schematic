defmodule Schematic.TableColumns.Config.Float do
  use Ecto.Schema
  import Ecto.Changeset

  @data_types [
    "REAL",
    "FLOAT",
    "DOUBLE PRECISION"
  ]

  @primary_key false

  embedded_schema do
    field :data_type, :string
    field :minimum_precision, :integer
  end

  def changeset(options, attrs \\ %{}) do
    options
    |> cast(attrs, [:data_type, :minimum_precision])
    |> validate_required([:data_type, :minimum_precision])
    |> validate_inclusion(:data_type, @data_types)
    |> validate_number(:minimum_precision, greater_than: 0)
  end

  # TODO: minimum_precision is optional
end
