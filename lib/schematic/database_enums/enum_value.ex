defmodule Schematic.DatabaseEnums.EnumValue do
  use Ecto.Schema
  import Ecto.Changeset
  alias Schematic.DatabaseEnums.DatabaseEnum

  schema "enum_values" do
    field :value, :string

    belongs_to :database_enum, DatabaseEnum

    timestamps()
  end

  @doc false
  def changeset(enum_values, attrs) do
    enum_values
    |> cast(attrs, [:value, :database_enum_id])
    |> validate_required([:value, :database_enum_id])
  end
end
