defmodule Schematic.TableColumns.Config.Amount do
  use Ecto.Schema
  import Ecto.Changeset

  @data_types [
    "CHAR",
    "VARCHAR",
    "BIT",
    "BIT VARYING"
  ]

  @primary_key false

  embedded_schema do
    field :data_type, :string
    field :amount, :integer
  end

  def changeset(options, attrs \\ %{}) do
    options
    |> cast(attrs, [:data_type, :amount])
    |> validate_required([:data_type, :amount])
    |> validate_inclusion(:data_type, @data_types)
    |> validate_number(:amount, greater_than: 0)
  end
end
