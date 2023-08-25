defmodule Schematic.TableColumns.Config.Geometric do
  use Ecto.Schema
  import Ecto.Changeset

  @data_types [
    "BOX",
    "CIRCLE",
    "LINE",
    "LSEG",
    "PATH",
    "POINT",
    "POLYGON"
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
