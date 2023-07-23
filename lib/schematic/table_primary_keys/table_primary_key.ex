defmodule Schematic.TablePrimaryKeys.TablePrimaryKey do
  use Ecto.Schema
  import Ecto.Changeset

  schema "table_primary_keys" do
    belongs_to :database_table, Schematic.DatabaseTables.DatabaseTable
    belongs_to :table_column, Schematic.TableColumns.TableColumn

    timestamps()
  end

  @doc false
  def changeset(table_primary_key, attrs) do
    table_primary_key
    |> cast(attrs, [:database_table_id, :table_column_id])
    |> validate_required([:database_table_id, :table_column_id])
    |> unique_constraint(:unique_column_pk, name: :unique_column_id_constraint)
  end
end
