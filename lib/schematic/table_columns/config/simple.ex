defmodule Schematic.TableColumns.Config.Simple do
  use Ecto.Schema
  import Ecto.Changeset

  @data_types [
    "TEXT",
    "SMALL INT",
    "INTEGER",
    "BIG INT",
    "BOOLEAN",
    "DATE",
    "TIME",
    "TIMESTAMP",
    "TIMESTAMPTZ",
    "SMALLSERIAL",
    "SERIAL",
    "BIGSERIAL",
    "JSON",
    "JSONB",
    "XML",
    # SPECIAL
    "FOREIGN KEY"
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
