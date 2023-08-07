defmodule Schematic.TableColumns.TableColumn do
  use Ecto.Schema
  import Ecto.Changeset

  alias Schematic.TableColumns.TableColumn
  alias Schematic.TableRelationships.TableRelationship

  schema "table_columns" do
    field :options, :map
    field :description, :string
    field :data_type, :string
    field :column_name, :string
    field :is_primary_key, :boolean, default: false
    field :is_nullable, :boolean, default: false
    field :is_unique, :boolean, default: false
    # is_indexed creates an explicit index for the single column
    # a unique constraint or primary key on a single column
    # will automatically have an index created regardless
    # multicolumn indexes will be documented in the MultiColumnIndexes table
    field :is_indexed, :boolean, default: false
    field :deleted, :boolean, default: false
    field :deleted_at, :utc_datetime

    belongs_to :database_table, Schematic.DatabaseTables.DatabaseTable
    has_many :constraint_relationships, Schematic.ConstraintColumns.ConstraintColumn

    many_to_many :referenced_by,
                 TableColumn,
                 join_through: TableRelationship,
                 join_keys: [primary_key_column_id: :id, foreign_key_column_id: :id]

    many_to_many :references,
                 TableColumn,
                 join_through: TableRelationship,
                 join_keys: [foreign_key_column_id: :id, primary_key_column_id: :id]

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
      :is_primary_key,
      :is_nullable,
      :is_unique,
      :is_indexed,
      :deleted,
      :deleted_at,
      :options,
      :database_table_id
    ])
    |> validate_required([:column_name, :database_table_id])
  end
end
