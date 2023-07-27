defmodule Schematic.Repo.Migrations.CreateTableRelationships do
  use Ecto.Migration

  def change do
    create table(:table_relationships) do
      add :primary_key_column_id, references(:table_columns, on_delete: :restrict), null: false
      add :foreign_key_column_id, references(:table_columns, on_delete: :delete_all), null: false
      add :on_delete, :string, null: false

      timestamps()
    end

    create index(:table_relationships, [:primary_key_column_id])
    create index(:table_relationships, [:foreign_key_column_id])

    create unique_index(:table_relationships, [:primary_key_column_id, :foreign_key_column_id],
             name: :table_relationships_pk_fk_index
           )

    create unique_index(:table_relationships, [:foreign_key_column_id, :primary_key_column_id],
             name: :table_relationships_fk_pk_index
           )
  end
end
