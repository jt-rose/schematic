defmodule Schematic.TableColumns.Config.UUID do
  use Ecto.Schema
  import Ecto.Changeset

  @data_types [
    "UUID"
  ]

  @primary_key false

  embedded_schema do
    field :data_type, :string
    # determine whether to use uuid auto-generation
    field :generated, :boolean
  end

  def changeset(options, attrs \\ %{}) do
    options
    |> cast(attrs, [:data_type, :generated])
    |> validate_required([:data_type, :generated])
    |> validate_inclusion(:data_type, @data_types)
  end
end
