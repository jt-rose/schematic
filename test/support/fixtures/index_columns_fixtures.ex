defmodule Schematic.IndexColumnsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Schematic.IndexColumns` context.
  """

  @doc """
  Generate a index_column.
  """
  def index_column_fixture(attrs \\ %{}) do
    {:ok, index_column} =
      attrs
      |> Enum.into(%{

      })
      |> Schematic.IndexColumns.create_index_column()

    index_column
  end
end
