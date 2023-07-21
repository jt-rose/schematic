defmodule Schematic.TableColumns.TableColumn do
  use Ecto.Schema
  import Ecto.Changeset

  schema "table_columns" do
    field :options, :map
    field :description, :string
    field :data_type, :string
    field :column_name, :string
    field :deleted, :boolean, default: false
    field :deleted_at, :utc_datetime
    field :table_id, :id

    timestamps()
  end

  @doc false
  def changeset(table_column, attrs) do
    table_column
    |> cast(attrs, [:column_name, :data_type, :description, :deleted, :deleted_at, :options])
    |> validate_required([:column_name, :data_type, :description, :deleted, :deleted_at, :options])
  end
end