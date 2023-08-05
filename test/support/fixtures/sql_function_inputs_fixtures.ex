defmodule Schematic.SqlFunctionInputsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Schematic.SqlFunctionInputs` context.
  """

  @doc """
  Generate a sql_function_input.
  """
  def sql_function_input_fixture(attrs \\ %{}) do
    {:ok, sql_function_input} =
      attrs
      |> Enum.into(%{
        placeholder_symbol: "some placeholder_symbol"
      })
      |> Schematic.SqlFunctionInputs.create_sql_function_input()

    sql_function_input
  end
end
