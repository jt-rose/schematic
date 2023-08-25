defmodule Schematic.TableColumns.Config.Money do
  use Ecto.Schema
  import Ecto.Changeset

  @data_types [
    "MONEY"
  ]

  @primary_key false

  embedded_schema do
    field :data_type, :string
    field :expected_lc_monetary, :string
  end

  def changeset(options, attrs \\ %{}) do
    options
    |> cast(attrs, [:data_type, :expected_lc_monetary])
    |> validate_required([:data_type])
    |> validate_inclusion(:data_type, @data_types)
  end
end
