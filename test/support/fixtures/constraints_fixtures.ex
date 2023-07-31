defmodule Schematic.ConstraintsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Schematic.Constraints` context.
  """

  @doc """
  Generate a constraint.
  """
  def constraint_fixture(attrs \\ %{}) do
    {:ok, constraint} =
      attrs
      |> Enum.into(%{
        name: "some name",
        description: "some description",
        check_expression: "some check_expression"
      })
      |> Schematic.Constraints.create_constraint()

    constraint
  end
end
