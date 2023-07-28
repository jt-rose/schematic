defmodule Schematic.TableRelationships.TableRelationship do
  use Ecto.Schema
  import Ecto.Changeset

  schema "table_relationships" do
    field :primary_key_column_id, :id
    field :foreign_key_column_id, :id

    field :on_delete, Ecto.Enum,
      values: [:restrict, :cascade, :no_action, :set_null, :set_default]

    field :on_update, Ecto.Enum,
      values: [:restrict, :cascade, :no_action, :set_null, :set_default]

    timestamps()
  end

  @doc false
  def changeset(table_relationship, attrs) do
    table_relationship
    |> cast(attrs, [:primary_key_column_id, :foreign_key_column_id, :on_delete, :on_update])
    |> validate_required([:primary_key_column_id, :foreign_key_column_id, :on_delete, :on_update])
    |> unique_constraint([:primary_key_column_id, :foreign_key_column_id],
      name: :table_relationships_pk_fk_index
    )
    |> unique_constraint([:foreign_key_column_id, :primary_key_column_id],
      name: :table_relationships_fk_pk_index
    )
  end
end
