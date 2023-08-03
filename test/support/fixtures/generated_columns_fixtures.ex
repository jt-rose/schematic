defmodule Schematic.GeneratedColumnsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Schematic.GeneratedColumns` context.
  """

  @doc """
  Generate a generated_column.
  """
  def generated_column_fixture(attrs \\ %{}) do
    {:ok, generated_column} =
      attrs
      |> Enum.into(%{
        name: "some name",
        description: "some description",
        check_expression: "some check_expression"
      })
      |> Schematic.GeneratedColumns.create_generated_column()

    generated_column
  end
end
