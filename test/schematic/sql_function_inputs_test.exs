defmodule Schematic.SqlFunctionInputsTest do
  use Schematic.DataCase

  alias Schematic.SqlFunctionInputs

  describe "sql_function_inputs" do
    alias Schematic.SqlFunctionInputs.SqlFunctionInput

    import Schematic.SqlFunctionInputsFixtures

    @invalid_attrs %{placeholder_symbol: nil}

    test "list_sql_function_inputs/0 returns all sql_function_inputs" do
      sql_function_input = sql_function_input_fixture()
      assert SqlFunctionInputs.list_sql_function_inputs() == [sql_function_input]
    end

    test "get_sql_function_input!/1 returns the sql_function_input with given id" do
      sql_function_input = sql_function_input_fixture()
      assert SqlFunctionInputs.get_sql_function_input!(sql_function_input.id) == sql_function_input
    end

    test "create_sql_function_input/1 with valid data creates a sql_function_input" do
      valid_attrs = %{placeholder_symbol: "some placeholder_symbol"}

      assert {:ok, %SqlFunctionInput{} = sql_function_input} = SqlFunctionInputs.create_sql_function_input(valid_attrs)
      assert sql_function_input.placeholder_symbol == "some placeholder_symbol"
    end

    test "create_sql_function_input/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SqlFunctionInputs.create_sql_function_input(@invalid_attrs)
    end

    test "update_sql_function_input/2 with valid data updates the sql_function_input" do
      sql_function_input = sql_function_input_fixture()
      update_attrs = %{placeholder_symbol: "some updated placeholder_symbol"}

      assert {:ok, %SqlFunctionInput{} = sql_function_input} = SqlFunctionInputs.update_sql_function_input(sql_function_input, update_attrs)
      assert sql_function_input.placeholder_symbol == "some updated placeholder_symbol"
    end

    test "update_sql_function_input/2 with invalid data returns error changeset" do
      sql_function_input = sql_function_input_fixture()
      assert {:error, %Ecto.Changeset{}} = SqlFunctionInputs.update_sql_function_input(sql_function_input, @invalid_attrs)
      assert sql_function_input == SqlFunctionInputs.get_sql_function_input!(sql_function_input.id)
    end

    test "delete_sql_function_input/1 deletes the sql_function_input" do
      sql_function_input = sql_function_input_fixture()
      assert {:ok, %SqlFunctionInput{}} = SqlFunctionInputs.delete_sql_function_input(sql_function_input)
      assert_raise Ecto.NoResultsError, fn -> SqlFunctionInputs.get_sql_function_input!(sql_function_input.id) end
    end

    test "change_sql_function_input/1 returns a sql_function_input changeset" do
      sql_function_input = sql_function_input_fixture()
      assert %Ecto.Changeset{} = SqlFunctionInputs.change_sql_function_input(sql_function_input)
    end
  end
end
