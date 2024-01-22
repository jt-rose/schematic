defmodule Schematic.SqlFunctionsTest do
  use Schematic.DataCase

  alias Schematic.Triggers

  describe "sql_functions" do
    alias Schematic.Triggers.SqlFunction

    import Schematic.SqlFunctionsFixtures

    @invalid_attrs %{name: nil, language: nil, function_code: nil}

    test "list_sql_functions/0 returns all sql_functions" do
      sql_function = sql_function_fixture()
      assert Triggers.list_sql_functions() == [sql_function]
    end

    test "get_sql_function!/1 returns the sql_function with given id" do
      sql_function = sql_function_fixture()
      assert Triggers.get_sql_function!(sql_function.id) == sql_function
    end

    test "create_sql_function/1 with valid data creates a sql_function" do
      valid_attrs = %{name: "some name", language: :pgsql, function_code: "some function_code"}

      assert {:ok, %SqlFunction{} = sql_function} = Triggers.create_sql_function(valid_attrs)
      assert sql_function.name == "some name"
      assert sql_function.language == :pgsql
      assert sql_function.function_code == "some function_code"
    end

    test "create_sql_function/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Triggers.create_sql_function(@invalid_attrs)
    end

    test "update_sql_function/2 with valid data updates the sql_function" do
      sql_function = sql_function_fixture()

      update_attrs = %{
        name: "some updated name",
        language: :tcl,
        function_code: "some updated function_code"
      }

      assert {:ok, %SqlFunction{} = sql_function} =
               Triggers.update_sql_function(sql_function, update_attrs)

      assert sql_function.name == "some updated name"
      assert sql_function.language == :tcl
      assert sql_function.function_code == "some updated function_code"
    end

    test "update_sql_function/2 with invalid data returns error changeset" do
      sql_function = sql_function_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Triggers.update_sql_function(sql_function, @invalid_attrs)

      assert sql_function == Triggers.get_sql_function!(sql_function.id)
    end

    test "delete_sql_function/1 deletes the sql_function" do
      sql_function = sql_function_fixture()
      assert {:ok, %SqlFunction{}} = Triggers.delete_sql_function(sql_function)
      assert_raise Ecto.NoResultsError, fn -> Triggers.get_sql_function!(sql_function.id) end
    end

    test "change_sql_function/1 returns a sql_function changeset" do
      sql_function = sql_function_fixture()
      assert %Ecto.Changeset{} = Triggers.change_sql_function(sql_function)
    end
  end
end
