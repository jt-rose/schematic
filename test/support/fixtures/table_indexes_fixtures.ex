defmodule Schematic.TableIndexesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Schematic.TableIndexes` context.
  """

  @doc """
  Generate a table_index.
  """
  def table_index_fixture(attrs \\ %{}) do
    {:ok, table_index} =
      attrs
      |> Enum.into(%{
        is_unique: true
      })
      |> Schematic.TableIndexes.create_table_index()

    table_index
  end
end
