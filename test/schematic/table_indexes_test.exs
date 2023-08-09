defmodule Schematic.TableIndexesTest do
  use Schematic.DataCase

  alias Schematic.TableIndexes

  describe "table_indexes" do
    alias Schematic.TableIndexes.TableIndex

    import Schematic.TableIndexesFixtures

    @invalid_attrs %{is_unique: nil}

    test "list_table_indexes/0 returns all table_indexes" do
      table_index = table_index_fixture()
      assert TableIndexes.list_table_indexes() == [table_index]
    end

    test "get_table_index!/1 returns the table_index with given id" do
      table_index = table_index_fixture()
      assert TableIndexes.get_table_index!(table_index.id) == table_index
    end

    test "create_table_index/1 with valid data creates a table_index" do
      valid_attrs = %{is_unique: true}

      assert {:ok, %TableIndex{} = table_index} = TableIndexes.create_table_index(valid_attrs)
      assert table_index.is_unique == true
    end

    test "create_table_index/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TableIndexes.create_table_index(@invalid_attrs)
    end

    test "update_table_index/2 with valid data updates the table_index" do
      table_index = table_index_fixture()
      update_attrs = %{is_unique: false}

      assert {:ok, %TableIndex{} = table_index} = TableIndexes.update_table_index(table_index, update_attrs)
      assert table_index.is_unique == false
    end

    test "update_table_index/2 with invalid data returns error changeset" do
      table_index = table_index_fixture()
      assert {:error, %Ecto.Changeset{}} = TableIndexes.update_table_index(table_index, @invalid_attrs)
      assert table_index == TableIndexes.get_table_index!(table_index.id)
    end

    test "delete_table_index/1 deletes the table_index" do
      table_index = table_index_fixture()
      assert {:ok, %TableIndex{}} = TableIndexes.delete_table_index(table_index)
      assert_raise Ecto.NoResultsError, fn -> TableIndexes.get_table_index!(table_index.id) end
    end

    test "change_table_index/1 returns a table_index changeset" do
      table_index = table_index_fixture()
      assert %Ecto.Changeset{} = TableIndexes.change_table_index(table_index)
    end
  end
end
