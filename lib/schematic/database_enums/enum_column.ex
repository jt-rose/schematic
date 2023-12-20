defmodule Schematic.DatabaseEnums.EnumColumn do
  use Ecto.Schema
  import Ecto.Changeset
  alias Schematic.DatabaseEnums.DatabaseEnum
  alias Schematic.DatabaseTables.DatabaseTable

  schema "enum_columns" do
    field :description, :string
    field :seq_order, :integer
    field :is_unique, :boolean, default: false
    field :column_name, :string
    field :array_depth, :integer
    field :is_primary_key, :boolean, default: false
    field :is_nullable, :boolean, default: false
    field :deleted, :boolean, default: false
    field :deleted_at, :utc_datetime

    belongs_to :database_enum, DatabaseEnum
    belongs_to :database_table, DatabaseTable

    timestamps()
  end

  @doc false
  def changeset(enum_column, attrs) do
    enum_column
    |> cast(attrs, [
      :column_name,
      :seq_order,
      :description,
      :array_depth,
      :is_primary_key,
      :is_nullable,
      :is_unique,
      :deleted,
      :deleted_at,
      :database_enum_id,
      :database_table_id
    ])
    |> validate_required([
      :column_name,
      :seq_order,
      :database_enum_id,
      :database_table_id
    ])
  end
end
