defmodule Schematic.TablePrimaryKeysTest do
  use Schematic.DataCase

  alias Schematic.TablePrimaryKeys

  describe "table_primary_keys" do
    alias Schematic.TablePrimaryKeys.TablePrimaryKey

    import Schematic.TablePrimaryKeysFixtures

    @invalid_attrs %{}

    test "list_table_primary_keys/0 returns all table_primary_keys" do
      table_primary_key = table_primary_key_fixture()
      assert TablePrimaryKeys.list_table_primary_keys() == [table_primary_key]
    end

    test "get_table_primary_key!/1 returns the table_primary_key with given id" do
      table_primary_key = table_primary_key_fixture()
      assert TablePrimaryKeys.get_table_primary_key!(table_primary_key.id) == table_primary_key
    end

    test "create_table_primary_key/1 with valid data creates a table_primary_key" do
      valid_attrs = %{}

      assert {:ok, %TablePrimaryKey{} = table_primary_key} = TablePrimaryKeys.create_table_primary_key(valid_attrs)
    end

    test "create_table_primary_key/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TablePrimaryKeys.create_table_primary_key(@invalid_attrs)
    end

    test "update_table_primary_key/2 with valid data updates the table_primary_key" do
      table_primary_key = table_primary_key_fixture()
      update_attrs = %{}

      assert {:ok, %TablePrimaryKey{} = table_primary_key} = TablePrimaryKeys.update_table_primary_key(table_primary_key, update_attrs)
    end

    test "update_table_primary_key/2 with invalid data returns error changeset" do
      table_primary_key = table_primary_key_fixture()
      assert {:error, %Ecto.Changeset{}} = TablePrimaryKeys.update_table_primary_key(table_primary_key, @invalid_attrs)
      assert table_primary_key == TablePrimaryKeys.get_table_primary_key!(table_primary_key.id)
    end

    test "delete_table_primary_key/1 deletes the table_primary_key" do
      table_primary_key = table_primary_key_fixture()
      assert {:ok, %TablePrimaryKey{}} = TablePrimaryKeys.delete_table_primary_key(table_primary_key)
      assert_raise Ecto.NoResultsError, fn -> TablePrimaryKeys.get_table_primary_key!(table_primary_key.id) end
    end

    test "change_table_primary_key/1 returns a table_primary_key changeset" do
      table_primary_key = table_primary_key_fixture()
      assert %Ecto.Changeset{} = TablePrimaryKeys.change_table_primary_key(table_primary_key)
    end
  end
end
