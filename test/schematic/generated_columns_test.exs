defmodule Schematic.GeneratedColumnsTest do
  use Schematic.DataCase

  alias Schematic.GeneratedColumns

  describe "generated_columns" do
    alias Schematic.GeneratedColumns.GeneratedColumn

    import Schematic.GeneratedColumnsFixtures

    @invalid_attrs %{name: nil, description: nil, check_expression: nil}

    test "list_generated_columns/0 returns all generated_columns" do
      generated_column = generated_column_fixture()
      assert GeneratedColumns.list_generated_columns() == [generated_column]
    end

    test "get_generated_column!/1 returns the generated_column with given id" do
      generated_column = generated_column_fixture()
      assert GeneratedColumns.get_generated_column!(generated_column.id) == generated_column
    end

    test "create_generated_column/1 with valid data creates a generated_column" do
      valid_attrs = %{name: "some name", description: "some description", check_expression: "some check_expression"}

      assert {:ok, %GeneratedColumn{} = generated_column} = GeneratedColumns.create_generated_column(valid_attrs)
      assert generated_column.name == "some name"
      assert generated_column.description == "some description"
      assert generated_column.check_expression == "some check_expression"
    end

    test "create_generated_column/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GeneratedColumns.create_generated_column(@invalid_attrs)
    end

    test "update_generated_column/2 with valid data updates the generated_column" do
      generated_column = generated_column_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", check_expression: "some updated check_expression"}

      assert {:ok, %GeneratedColumn{} = generated_column} = GeneratedColumns.update_generated_column(generated_column, update_attrs)
      assert generated_column.name == "some updated name"
      assert generated_column.description == "some updated description"
      assert generated_column.check_expression == "some updated check_expression"
    end

    test "update_generated_column/2 with invalid data returns error changeset" do
      generated_column = generated_column_fixture()
      assert {:error, %Ecto.Changeset{}} = GeneratedColumns.update_generated_column(generated_column, @invalid_attrs)
      assert generated_column == GeneratedColumns.get_generated_column!(generated_column.id)
    end

    test "delete_generated_column/1 deletes the generated_column" do
      generated_column = generated_column_fixture()
      assert {:ok, %GeneratedColumn{}} = GeneratedColumns.delete_generated_column(generated_column)
      assert_raise Ecto.NoResultsError, fn -> GeneratedColumns.get_generated_column!(generated_column.id) end
    end

    test "change_generated_column/1 returns a generated_column changeset" do
      generated_column = generated_column_fixture()
      assert %Ecto.Changeset{} = GeneratedColumns.change_generated_column(generated_column)
    end
  end
end
