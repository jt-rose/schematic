defmodule Schematic.TableColumns.TableColumn do
  use Ecto.Schema
  import Ecto.Changeset
  import PolymorphicEmbed

  alias Schematic.DatabaseTables.DatabaseTable
  alias Schematic.Constraints.ConstraintColumn
  alias Schematic.TableIndexes.TableIndex
  alias Schematic.TableIndexes.IndexColumn
  alias Schematic.TableColumns.TableColumn
  alias Schematic.TableRelationships.TableRelationship
  alias Schematic.TableColumns.Config

  schema "table_columns" do
    field :description, :string
    field :column_name, :string
    field :array_depth, :integer, default: 0
    field :is_primary_key, :boolean, default: false
    field :is_nullable, :boolean, default: false
    field :is_unique, :boolean, default: false
    field :deleted, :boolean, default: false
    field :deleted_at, :utc_datetime
    # TODO: defaults

    polymorphic_embeds_one(:config,
      types: [
        simple: Config.Simple,
        amount: Config.Amount,
        decimal: Config.Decimal,
        money: Config.Money,
        float: Config.Float,
        interval: Config.Interval,
        uuid: Config.UUID
        # sample schema detected by fields present:
        # email: [
        #   module: MyApp.Channel.Email,
        #   identify_by_fields: [:address, :confirmed]]
      ],
      on_type_not_found: :raise,
      on_replace: :update
    )

    belongs_to :database_table, DatabaseTable
    has_many :constraint_relationships, ConstraintColumn
    has_many :index_columns, IndexColumn

    many_to_many :table_indexes,
                 TableIndex,
                 join_through: IndexColumn

    many_to_many :referenced_by,
                 TableColumn,
                 join_through: TableRelationship,
                 join_keys: [primary_key_column_id: :id, foreign_key_column_id: :id]

    many_to_many :references,
                 TableColumn,
                 join_through: TableRelationship,
                 join_keys: [foreign_key_column_id: :id, primary_key_column_id: :id]

    # TODO: add db unique constraint for column name + table_id

    timestamps()
  end

  @doc false
  def changeset(table_column, attrs) do
    table_column
    |> cast(attrs, [
      :column_name,
      :description,
      :array_depth,
      :is_primary_key,
      :is_nullable,
      :is_unique,
      :deleted,
      :deleted_at,
      :database_table_id
    ])
    |> cast_polymorphic_embed(:config, required: false)
    |> validate_required([:column_name, :database_table_id])
    |> validate_number(:array_depth, greater_than: 0, less_than: 4)

    # TODO: add custom validation to reject array_depth > 0 when is_primary_key == true
  end
end
