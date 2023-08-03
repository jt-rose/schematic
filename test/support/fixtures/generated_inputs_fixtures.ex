defmodule Schematic.GeneratedInputsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Schematic.GeneratedInputs` context.
  """

  @doc """
  Generate a generated_input.
  """
  def generated_input_fixture(attrs \\ %{}) do
    {:ok, generated_input} =
      attrs
      |> Enum.into(%{
        placeholder_symbol: "some placeholder_symbol"
      })
      |> Schematic.GeneratedInputs.create_generated_input()

    generated_input
  end
end
