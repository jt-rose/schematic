defmodule Schematic.TableForeignKeysTest do
  use Schematic.DataCase

  alias Schematic.TableForeignKeys

  describe "table_foreign_keys" do
    alias Schematic.TableForeignKeys.TableForeignKey

    import Schematic.TableForeignKeysFixtures

    @invalid_attrs %{}

    test "list_table_foreign_keys/0 returns all table_foreign_keys" do
      table_foreign_key = table_foreign_key_fixture()
      assert TableForeignKeys.list_table_foreign_keys() == [table_foreign_key]
    end

    test "get_table_foreign_key!/1 returns the table_foreign_key with given id" do
      table_foreign_key = table_foreign_key_fixture()
      assert TableForeignKeys.get_table_foreign_key!(table_foreign_key.id) == table_foreign_key
    end

    test "create_table_foreign_key/1 with valid data creates a table_foreign_key" do
      valid_attrs = %{}

      assert {:ok, %TableForeignKey{} = table_foreign_key} = TableForeignKeys.create_table_foreign_key(valid_attrs)
    end

    test "create_table_foreign_key/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TableForeignKeys.create_table_foreign_key(@invalid_attrs)
    end

    test "update_table_foreign_key/2 with valid data updates the table_foreign_key" do
      table_foreign_key = table_foreign_key_fixture()
      update_attrs = %{}

      assert {:ok, %TableForeignKey{} = table_foreign_key} = TableForeignKeys.update_table_foreign_key(table_foreign_key, update_attrs)
    end

    test "update_table_foreign_key/2 with invalid data returns error changeset" do
      table_foreign_key = table_foreign_key_fixture()
      assert {:error, %Ecto.Changeset{}} = TableForeignKeys.update_table_foreign_key(table_foreign_key, @invalid_attrs)
      assert table_foreign_key == TableForeignKeys.get_table_foreign_key!(table_foreign_key.id)
    end

    test "delete_table_foreign_key/1 deletes the table_foreign_key" do
      table_foreign_key = table_foreign_key_fixture()
      assert {:ok, %TableForeignKey{}} = TableForeignKeys.delete_table_foreign_key(table_foreign_key)
      assert_raise Ecto.NoResultsError, fn -> TableForeignKeys.get_table_foreign_key!(table_foreign_key.id) end
    end

    test "change_table_foreign_key/1 returns a table_foreign_key changeset" do
      table_foreign_key = table_foreign_key_fixture()
      assert %Ecto.Changeset{} = TableForeignKeys.change_table_foreign_key(table_foreign_key)
    end
  end
end
