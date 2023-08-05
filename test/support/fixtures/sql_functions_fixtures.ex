defmodule Schematic.SqlFunctionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Schematic.SqlFunctions` context.
  """

  @doc """
  Generate a sql_function.
  """
  def sql_function_fixture(attrs \\ %{}) do
    {:ok, sql_function} =
      attrs
      |> Enum.into(%{
        name: "some name",
        language: :pgsql,
        function_code: "some function_code"
      })
      |> Schematic.SqlFunctions.create_sql_function()

    sql_function
  end
end
