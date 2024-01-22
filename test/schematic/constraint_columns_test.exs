defmodule Schematic.ConstraintColumnsTest do
  use Schematic.DataCase

  alias Schematic.Constraints

  describe "constraint_columns" do
    alias Schematic.Constraints.ConstraintColumn

    import Schematic.ConstraintColumnsFixtures

    @invalid_attrs %{placeholder_symbol: nil}

    test "list_constraint_columns/0 returns all constraint_columns" do
      constraint_column = constraint_column_fixture()
      assert Constraints.list_constraint_columns() == [constraint_column]
    end

    test "get_constraint_column!/1 returns the constraint_column with given id" do
      constraint_column = constraint_column_fixture()
      assert Constraints.get_constraint_column!(constraint_column.id) == constraint_column
    end

    test "create_constraint_column/1 with valid data creates a constraint_column" do
      valid_attrs = %{placeholder_symbol: "some placeholder_symbol"}

      assert {:ok, %ConstraintColumn{} = constraint_column} =
               Constraints.create_constraint_column(valid_attrs)

      assert constraint_column.placeholder_symbol == "some placeholder_symbol"
    end

    test "create_constraint_column/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Constraints.create_constraint_column(@invalid_attrs)
    end

    test "update_constraint_column/2 with valid data updates the constraint_column" do
      constraint_column = constraint_column_fixture()
      update_attrs = %{placeholder_symbol: "some updated placeholder_symbol"}

      assert {:ok, %ConstraintColumn{} = constraint_column} =
               Constraints.update_constraint_column(constraint_column, update_attrs)

      assert constraint_column.placeholder_symbol == "some updated placeholder_symbol"
    end

    test "update_constraint_column/2 with invalid data returns error changeset" do
      constraint_column = constraint_column_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Constraints.update_constraint_column(constraint_column, @invalid_attrs)

      assert constraint_column == Constraints.get_constraint_column!(constraint_column.id)
    end

    test "delete_constraint_column/1 deletes the constraint_column" do
      constraint_column = constraint_column_fixture()
      assert {:ok, %ConstraintColumn{}} = Constraints.delete_constraint_column(constraint_column)

      assert_raise Ecto.NoResultsError, fn ->
        Constraints.get_constraint_column!(constraint_column.id)
      end
    end

    test "change_constraint_column/1 returns a constraint_column changeset" do
      constraint_column = constraint_column_fixture()
      assert %Ecto.Changeset{} = Constraints.change_constraint_column(constraint_column)
    end
  end
end
