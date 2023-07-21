defmodule Schematic.TableColumnsTest do
  use Schematic.DataCase

  alias Schematic.TableColumns

  describe "table_columns" do
    alias Schematic.TableColumns.TableColumn

    import Schematic.TableColumnsFixtures

    @invalid_attrs %{options: nil, description: nil, data_type: nil, column_name: nil, deleted: nil, deleted_at: nil}

    test "list_table_columns/0 returns all table_columns" do
      table_column = table_column_fixture()
      assert TableColumns.list_table_columns() == [table_column]
    end

    test "get_table_column!/1 returns the table_column with given id" do
      table_column = table_column_fixture()
      assert TableColumns.get_table_column!(table_column.id) == table_column
    end

    test "create_table_column/1 with valid data creates a table_column" do
      valid_attrs = %{options: %{}, description: "some description", data_type: "some data_type", column_name: "some column_name", deleted: true, deleted_at: ~U[2023-07-20 02:18:00Z]}

      assert {:ok, %TableColumn{} = table_column} = TableColumns.create_table_column(valid_attrs)
      assert table_column.options == %{}
      assert table_column.description == "some description"
      assert table_column.data_type == "some data_type"
      assert table_column.column_name == "some column_name"
      assert table_column.deleted == true
      assert table_column.deleted_at == ~U[2023-07-20 02:18:00Z]
    end

    test "create_table_column/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TableColumns.create_table_column(@invalid_attrs)
    end

    test "update_table_column/2 with valid data updates the table_column" do
      table_column = table_column_fixture()
      update_attrs = %{options: %{}, description: "some updated description", data_type: "some updated data_type", column_name: "some updated column_name", deleted: false, deleted_at: ~U[2023-07-21 02:18:00Z]}

      assert {:ok, %TableColumn{} = table_column} = TableColumns.update_table_column(table_column, update_attrs)
      assert table_column.options == %{}
      assert table_column.description == "some updated description"
      assert table_column.data_type == "some updated data_type"
      assert table_column.column_name == "some updated column_name"
      assert table_column.deleted == false
      assert table_column.deleted_at == ~U[2023-07-21 02:18:00Z]
    end

    test "update_table_column/2 with invalid data returns error changeset" do
      table_column = table_column_fixture()
      assert {:error, %Ecto.Changeset{}} = TableColumns.update_table_column(table_column, @invalid_attrs)
      assert table_column == TableColumns.get_table_column!(table_column.id)
    end

    test "delete_table_column/1 deletes the table_column" do
      table_column = table_column_fixture()
      assert {:ok, %TableColumn{}} = TableColumns.delete_table_column(table_column)
      assert_raise Ecto.NoResultsError, fn -> TableColumns.get_table_column!(table_column.id) end
    end

    test "change_table_column/1 returns a table_column changeset" do
      table_column = table_column_fixture()
      assert %Ecto.Changeset{} = TableColumns.change_table_column(table_column)
    end
  end
end
