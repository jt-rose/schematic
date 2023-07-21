defmodule Schematic.DatabaseTablesTest do
  use Schematic.DataCase

  alias Schematic.DatabaseTables

  describe "database_tables" do
    alias Schematic.DatabaseTables.DatabaseTable

    import Schematic.DatabaseTablesFixtures

    @invalid_attrs %{name: nil, description: nil, deleted: nil, deleted_at: nil}

    test "list_database_tables/0 returns all database_tables" do
      database_table = database_table_fixture()
      assert DatabaseTables.list_database_tables() == [database_table]
    end

    test "get_database_table!/1 returns the database_table with given id" do
      database_table = database_table_fixture()
      assert DatabaseTables.get_database_table!(database_table.id) == database_table
    end

    test "create_database_table/1 with valid data creates a database_table" do
      valid_attrs = %{name: "some name", description: "some description", deleted: true, deleted_at: ~U[2023-07-20 02:06:00Z]}

      assert {:ok, %DatabaseTable{} = database_table} = DatabaseTables.create_database_table(valid_attrs)
      assert database_table.name == "some name"
      assert database_table.description == "some description"
      assert database_table.deleted == true
      assert database_table.deleted_at == ~U[2023-07-20 02:06:00Z]
    end

    test "create_database_table/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = DatabaseTables.create_database_table(@invalid_attrs)
    end

    test "update_database_table/2 with valid data updates the database_table" do
      database_table = database_table_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", deleted: false, deleted_at: ~U[2023-07-21 02:06:00Z]}

      assert {:ok, %DatabaseTable{} = database_table} = DatabaseTables.update_database_table(database_table, update_attrs)
      assert database_table.name == "some updated name"
      assert database_table.description == "some updated description"
      assert database_table.deleted == false
      assert database_table.deleted_at == ~U[2023-07-21 02:06:00Z]
    end

    test "update_database_table/2 with invalid data returns error changeset" do
      database_table = database_table_fixture()
      assert {:error, %Ecto.Changeset{}} = DatabaseTables.update_database_table(database_table, @invalid_attrs)
      assert database_table == DatabaseTables.get_database_table!(database_table.id)
    end

    test "delete_database_table/1 deletes the database_table" do
      database_table = database_table_fixture()
      assert {:ok, %DatabaseTable{}} = DatabaseTables.delete_database_table(database_table)
      assert_raise Ecto.NoResultsError, fn -> DatabaseTables.get_database_table!(database_table.id) end
    end

    test "change_database_table/1 returns a database_table changeset" do
      database_table = database_table_fixture()
      assert %Ecto.Changeset{} = DatabaseTables.change_database_table(database_table)
    end
  end
end
