defmodule Schematic.TableIndexes.TableIndex do
  use Ecto.Schema
  import Ecto.Changeset

  alias Schematic.TableColumns.TableColumn
  alias Schematic.IndexColumns.IndexColumn

  schema "table_indexes" do
    field :is_unique, :boolean, default: false

    belongs_to :database_table, Schematic.DatabaseTables.DatabaseTable
    has_many :index_columns, Schematic.IndexColumns.IndexColumn

    many_to_many :table_columns,
                 TableColumn,
                 join_through: IndexColumn

    timestamps()
  end

  @doc false
  def changeset(table_index, attrs) do
    table_index
    |> cast(attrs, [:is_unique, :database_table_id])
    |> validate_required([:is_unique, :database_table_id])
  end
end
