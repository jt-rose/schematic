defmodule Schematic.TableColumns.Config.Network do
  use Ecto.Schema
  import Ecto.Changeset

  @data_types [
    "CIDR",
    "INET",
    "MACADDR",
    "MACADDR8"
  ]

  @primary_key false

  embedded_schema do
    field :data_type, :string
  end

  def changeset(options, attrs \\ %{}) do
    options
    |> cast(attrs, [:data_type])
    |> validate_required([:data_type])
    |> validate_inclusion(:data_type, @data_types)
  end
end
