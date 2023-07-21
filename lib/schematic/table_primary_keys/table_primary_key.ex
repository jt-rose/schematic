defmodule Schematic.TablePrimaryKeys.TablePrimaryKey do
  use Ecto.Schema
  import Ecto.Changeset

  schema "table_primary_keys" do
    field :database_table_id, :id
    field :table_column_id, :id

    timestamps()
  end

  @doc false
  def changeset(table_primary_key, attrs) do
    table_primary_key
    |> cast(attrs, [])
    |> validate_required([])
    |> unique_constraint(:unique_table_and_column_pk, name: :unique_table_and_column_constraint)
  end
end
