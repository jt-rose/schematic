defmodule Schematic.TableColumns.Config.Decimal do
  use Ecto.Schema
  import Ecto.Changeset

  @data_types [
    "DOUBLE PRECISION",
    "DECIMAL",
    "NUMERIC"
  ]

  @primary_key false

  embedded_schema do
    field :data_type, :string
    field :precision, :integer
    field :scale, :integer
  end

  def changeset(options, attrs \\ %{}) do
    options
    |> cast(attrs, [:data_type, :precision, :scale])
    |> validate_required([:data_type, :precision, :scale])
    |> validate_inclusion(:data_type, @data_types)
    |> validate_number(:precision, greater_than: 0)
    |> validate_number(:scale, greater_than: 0)
  end

  # TODO: 0 values are allowed, although this seems like a bad practice
end
