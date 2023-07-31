defmodule Schematic.ConstraintsTest do
  use Schematic.DataCase

  alias Schematic.Constraints

  describe "constraints" do
    alias Schematic.Constraints.Constraint

    import Schematic.ConstraintsFixtures

    @invalid_attrs %{name: nil, description: nil, check_expression: nil}

    test "list_constraints/0 returns all constraints" do
      constraint = constraint_fixture()
      assert Constraints.list_constraints() == [constraint]
    end

    test "get_constraint!/1 returns the constraint with given id" do
      constraint = constraint_fixture()
      assert Constraints.get_constraint!(constraint.id) == constraint
    end

    test "create_constraint/1 with valid data creates a constraint" do
      valid_attrs = %{name: "some name", description: "some description", check_expression: "some check_expression"}

      assert {:ok, %Constraint{} = constraint} = Constraints.create_constraint(valid_attrs)
      assert constraint.name == "some name"
      assert constraint.description == "some description"
      assert constraint.check_expression == "some check_expression"
    end

    test "create_constraint/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Constraints.create_constraint(@invalid_attrs)
    end

    test "update_constraint/2 with valid data updates the constraint" do
      constraint = constraint_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", check_expression: "some updated check_expression"}

      assert {:ok, %Constraint{} = constraint} = Constraints.update_constraint(constraint, update_attrs)
      assert constraint.name == "some updated name"
      assert constraint.description == "some updated description"
      assert constraint.check_expression == "some updated check_expression"
    end

    test "update_constraint/2 with invalid data returns error changeset" do
      constraint = constraint_fixture()
      assert {:error, %Ecto.Changeset{}} = Constraints.update_constraint(constraint, @invalid_attrs)
      assert constraint == Constraints.get_constraint!(constraint.id)
    end

    test "delete_constraint/1 deletes the constraint" do
      constraint = constraint_fixture()
      assert {:ok, %Constraint{}} = Constraints.delete_constraint(constraint)
      assert_raise Ecto.NoResultsError, fn -> Constraints.get_constraint!(constraint.id) end
    end

    test "change_constraint/1 returns a constraint changeset" do
      constraint = constraint_fixture()
      assert %Ecto.Changeset{} = Constraints.change_constraint(constraint)
    end
  end
end
