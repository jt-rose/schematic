defmodule Schematic.ConstraintColumnsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Schematic.ConstraintColumns` context.
  """

  @doc """
  Generate a constraint_column.
  """
  def constraint_column_fixture(attrs \\ %{}) do
    {:ok, constraint_column} =
      attrs
      |> Enum.into(%{
        placeholder_symbol: "some placeholder_symbol"
      })
      |> Schematic.ConstraintColumns.create_constraint_column()

    constraint_column
  end
end
