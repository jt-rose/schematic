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

    belongs_to :database_table, Schematic.DatabaseTables.DatabaseTable
    has_one :table_primary_key, Schematic.TablePrimaryKeys.TablePrimaryKey

    # TODO: embed_schema :options, %{}
    # TODO: add db unique constraint for column name + table_id

    timestamps()
  end

  @doc false
  def changeset(table_column, attrs) do
    table_column
    |> cast(attrs, [
      :column_name,
      :data_type,
      :description,
      :deleted,
      :deleted_at,
      :options,
      :database_table_id
    ])
    |> validate_required([:column_name, :database_table_id])
  end
end
