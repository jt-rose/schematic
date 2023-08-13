defmodule Schematic.TableIndexes.IndexColumn do
  use Ecto.Schema
  import Ecto.Changeset

  alias Schematic.TableColumns.TableColumn
  alias Schematic.TableIndexes.TableIndex

  schema "index_columns" do
    belongs_to :table_column, TableColumn
    belongs_to :table_index, TableIndex

    timestamps()
  end

  @doc false
  def changeset(index_column, attrs) do
    index_column
    |> cast(attrs, [:table_column_id, :table_index_id])
    |> validate_required([:table_column_id, :table_index_id])
  end
end
