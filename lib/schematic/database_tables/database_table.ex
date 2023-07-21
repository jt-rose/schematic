defmodule Schematic.DatabaseTables.DatabaseTable do
  use Ecto.Schema
  import Ecto.Changeset

  schema "database_tables" do
    field :name, :string
    field :description, :string
    field :deleted, :boolean, default: false
    field :deleted_at, :utc_datetime
    field :project_database_id, :id
    field :pk, :id

    timestamps()
  end

  @doc false
  def changeset(database_table, attrs) do
    database_table
    |> cast(attrs, [:name, :description, :deleted, :deleted_at])
    |> validate_required([:name, :description, :deleted, :deleted_at])
  end
end
