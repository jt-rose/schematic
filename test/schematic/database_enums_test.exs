defmodule Schematic.DatabaseEnumsTest do
  use Schematic.DataCase

  alias Schematic.DatabaseEnums

  describe "database_enums" do
    alias Schematic.DatabaseEnums.DatabaseEnum

    import Schematic.DatabaseEnumsFixtures

    @invalid_attrs %{name: nil, description: nil}

    test "list_database_enums/0 returns all database_enums" do
      database_enum = database_enum_fixture()
      assert DatabaseEnums.list_database_enums() == [database_enum]
    end

    test "get_database_enum!/1 returns the database_enum with given id" do
      database_enum = database_enum_fixture()
      assert DatabaseEnums.get_database_enum!(database_enum.id) == database_enum
    end

    test "create_database_enum/1 with valid data creates a database_enum" do
      valid_attrs = %{name: "some name", description: "some description"}

      assert {:ok, %DatabaseEnum{} = database_enum} = DatabaseEnums.create_database_enum(valid_attrs)
      assert database_enum.name == "some name"
      assert database_enum.description == "some description"
    end

    test "create_database_enum/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = DatabaseEnums.create_database_enum(@invalid_attrs)
    end

    test "update_database_enum/2 with valid data updates the database_enum" do
      database_enum = database_enum_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description"}

      assert {:ok, %DatabaseEnum{} = database_enum} = DatabaseEnums.update_database_enum(database_enum, update_attrs)
      assert database_enum.name == "some updated name"
      assert database_enum.description == "some updated description"
    end

    test "update_database_enum/2 with invalid data returns error changeset" do
      database_enum = database_enum_fixture()
      assert {:error, %Ecto.Changeset{}} = DatabaseEnums.update_database_enum(database_enum, @invalid_attrs)
      assert database_enum == DatabaseEnums.get_database_enum!(database_enum.id)
    end

    test "delete_database_enum/1 deletes the database_enum" do
      database_enum = database_enum_fixture()
      assert {:ok, %DatabaseEnum{}} = DatabaseEnums.delete_database_enum(database_enum)
      assert_raise Ecto.NoResultsError, fn -> DatabaseEnums.get_database_enum!(database_enum.id) end
    end

    test "change_database_enum/1 returns a database_enum changeset" do
      database_enum = database_enum_fixture()
      assert %Ecto.Changeset{} = DatabaseEnums.change_database_enum(database_enum)
    end
  end

  describe "enum_values" do
    alias Schematic.DatabaseEnums.EnumValues

    import Schematic.DatabaseEnumsFixtures

    @invalid_attrs %{value: nil}

    test "list_enum_values/0 returns all enum_values" do
      enum_values = enum_values_fixture()
      assert DatabaseEnums.list_enum_values() == [enum_values]
    end

    test "get_enum_values!/1 returns the enum_values with given id" do
      enum_values = enum_values_fixture()
      assert DatabaseEnums.get_enum_values!(enum_values.id) == enum_values
    end

    test "create_enum_values/1 with valid data creates a enum_values" do
      valid_attrs = %{value: "some value"}

      assert {:ok, %EnumValues{} = enum_values} = DatabaseEnums.create_enum_values(valid_attrs)
      assert enum_values.value == "some value"
    end

    test "create_enum_values/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = DatabaseEnums.create_enum_values(@invalid_attrs)
    end

    test "update_enum_values/2 with valid data updates the enum_values" do
      enum_values = enum_values_fixture()
      update_attrs = %{value: "some updated value"}

      assert {:ok, %EnumValues{} = enum_values} = DatabaseEnums.update_enum_values(enum_values, update_attrs)
      assert enum_values.value == "some updated value"
    end

    test "update_enum_values/2 with invalid data returns error changeset" do
      enum_values = enum_values_fixture()
      assert {:error, %Ecto.Changeset{}} = DatabaseEnums.update_enum_values(enum_values, @invalid_attrs)
      assert enum_values == DatabaseEnums.get_enum_values!(enum_values.id)
    end

    test "delete_enum_values/1 deletes the enum_values" do
      enum_values = enum_values_fixture()
      assert {:ok, %EnumValues{}} = DatabaseEnums.delete_enum_values(enum_values)
      assert_raise Ecto.NoResultsError, fn -> DatabaseEnums.get_enum_values!(enum_values.id) end
    end

    test "change_enum_values/1 returns a enum_values changeset" do
      enum_values = enum_values_fixture()
      assert %Ecto.Changeset{} = DatabaseEnums.change_enum_values(enum_values)
    end
  end

  describe "enum_columns" do
    alias Schematic.DatabaseEnums.EnumColumn

    import Schematic.DatabaseEnumsFixtures

    @invalid_attrs %{description: nil, is_unique: nil, column_name: nil, array_depth: nil, is_primary_key: nil, is_nullable: nil, deleted: nil, deleted_at: nil}

    test "list_enum_columns/0 returns all enum_columns" do
      enum_column = enum_column_fixture()
      assert DatabaseEnums.list_enum_columns() == [enum_column]
    end

    test "get_enum_column!/1 returns the enum_column with given id" do
      enum_column = enum_column_fixture()
      assert DatabaseEnums.get_enum_column!(enum_column.id) == enum_column
    end

    test "create_enum_column/1 with valid data creates a enum_column" do
      valid_attrs = %{description: "some description", is_unique: true, column_name: "some column_name", array_depth: 42, is_primary_key: true, is_nullable: true, deleted: true, deleted_at: ~U[2023-09-04 17:06:00Z]}

      assert {:ok, %EnumColumn{} = enum_column} = DatabaseEnums.create_enum_column(valid_attrs)
      assert enum_column.description == "some description"
      assert enum_column.is_unique == true
      assert enum_column.column_name == "some column_name"
      assert enum_column.array_depth == 42
      assert enum_column.is_primary_key == true
      assert enum_column.is_nullable == true
      assert enum_column.deleted == true
      assert enum_column.deleted_at == ~U[2023-09-04 17:06:00Z]
    end

    test "create_enum_column/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = DatabaseEnums.create_enum_column(@invalid_attrs)
    end

    test "update_enum_column/2 with valid data updates the enum_column" do
      enum_column = enum_column_fixture()
      update_attrs = %{description: "some updated description", is_unique: false, column_name: "some updated column_name", array_depth: 43, is_primary_key: false, is_nullable: false, deleted: false, deleted_at: ~U[2023-09-05 17:06:00Z]}

      assert {:ok, %EnumColumn{} = enum_column} = DatabaseEnums.update_enum_column(enum_column, update_attrs)
      assert enum_column.description == "some updated description"
      assert enum_column.is_unique == false
      assert enum_column.column_name == "some updated column_name"
      assert enum_column.array_depth == 43
      assert enum_column.is_primary_key == false
      assert enum_column.is_nullable == false
      assert enum_column.deleted == false
      assert enum_column.deleted_at == ~U[2023-09-05 17:06:00Z]
    end

    test "update_enum_column/2 with invalid data returns error changeset" do
      enum_column = enum_column_fixture()
      assert {:error, %Ecto.Changeset{}} = DatabaseEnums.update_enum_column(enum_column, @invalid_attrs)
      assert enum_column == DatabaseEnums.get_enum_column!(enum_column.id)
    end

    test "delete_enum_column/1 deletes the enum_column" do
      enum_column = enum_column_fixture()
      assert {:ok, %EnumColumn{}} = DatabaseEnums.delete_enum_column(enum_column)
      assert_raise Ecto.NoResultsError, fn -> DatabaseEnums.get_enum_column!(enum_column.id) end
    end

    test "change_enum_column/1 returns a enum_column changeset" do
      enum_column = enum_column_fixture()
      assert %Ecto.Changeset{} = DatabaseEnums.change_enum_column(enum_column)
    end
  end
end
