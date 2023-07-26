defmodule Schematic.TableRelationshipsTest do
  use Schematic.DataCase

  alias Schematic.TableRelationships

  describe "table_relationships" do
    alias Schematic.TableRelationships.TableRelationship

    import Schematic.TableRelationshipsFixtures

    @invalid_attrs %{}

    test "list_table_relationships/0 returns all table_relationships" do
      table_relationship = table_relationship_fixture()
      assert TableRelationships.list_table_relationships() == [table_relationship]
    end

    test "get_table_relationship!/1 returns the table_relationship with given id" do
      table_relationship = table_relationship_fixture()
      assert TableRelationships.get_table_relationship!(table_relationship.id) == table_relationship
    end

    test "create_table_relationship/1 with valid data creates a table_relationship" do
      valid_attrs = %{}

      assert {:ok, %TableRelationship{} = table_relationship} = TableRelationships.create_table_relationship(valid_attrs)
    end

    test "create_table_relationship/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TableRelationships.create_table_relationship(@invalid_attrs)
    end

    test "update_table_relationship/2 with valid data updates the table_relationship" do
      table_relationship = table_relationship_fixture()
      update_attrs = %{}

      assert {:ok, %TableRelationship{} = table_relationship} = TableRelationships.update_table_relationship(table_relationship, update_attrs)
    end

    test "update_table_relationship/2 with invalid data returns error changeset" do
      table_relationship = table_relationship_fixture()
      assert {:error, %Ecto.Changeset{}} = TableRelationships.update_table_relationship(table_relationship, @invalid_attrs)
      assert table_relationship == TableRelationships.get_table_relationship!(table_relationship.id)
    end

    test "delete_table_relationship/1 deletes the table_relationship" do
      table_relationship = table_relationship_fixture()
      assert {:ok, %TableRelationship{}} = TableRelationships.delete_table_relationship(table_relationship)
      assert_raise Ecto.NoResultsError, fn -> TableRelationships.get_table_relationship!(table_relationship.id) end
    end

    test "change_table_relationship/1 returns a table_relationship changeset" do
      table_relationship = table_relationship_fixture()
      assert %Ecto.Changeset{} = TableRelationships.change_table_relationship(table_relationship)
    end
  end
end
