defmodule Schematic.IndexColumnsTest do
  use Schematic.DataCase

  alias Schematic.IndexColumns

  describe "index_columns" do
    alias Schematic.IndexColumns.IndexColumn

    import Schematic.IndexColumnsFixtures

    @invalid_attrs %{}

    test "list_index_columns/0 returns all index_columns" do
      index_column = index_column_fixture()
      assert IndexColumns.list_index_columns() == [index_column]
    end

    test "get_index_column!/1 returns the index_column with given id" do
      index_column = index_column_fixture()
      assert IndexColumns.get_index_column!(index_column.id) == index_column
    end

    test "create_index_column/1 with valid data creates a index_column" do
      valid_attrs = %{}

      assert {:ok, %IndexColumn{} = index_column} = IndexColumns.create_index_column(valid_attrs)
    end

    test "create_index_column/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = IndexColumns.create_index_column(@invalid_attrs)
    end

    test "update_index_column/2 with valid data updates the index_column" do
      index_column = index_column_fixture()
      update_attrs = %{}

      assert {:ok, %IndexColumn{} = index_column} = IndexColumns.update_index_column(index_column, update_attrs)
    end

    test "update_index_column/2 with invalid data returns error changeset" do
      index_column = index_column_fixture()
      assert {:error, %Ecto.Changeset{}} = IndexColumns.update_index_column(index_column, @invalid_attrs)
      assert index_column == IndexColumns.get_index_column!(index_column.id)
    end

    test "delete_index_column/1 deletes the index_column" do
      index_column = index_column_fixture()
      assert {:ok, %IndexColumn{}} = IndexColumns.delete_index_column(index_column)
      assert_raise Ecto.NoResultsError, fn -> IndexColumns.get_index_column!(index_column.id) end
    end

    test "change_index_column/1 returns a index_column changeset" do
      index_column = index_column_fixture()
      assert %Ecto.Changeset{} = IndexColumns.change_index_column(index_column)
    end
  end
end
