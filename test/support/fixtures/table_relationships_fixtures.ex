defmodule Schematic.TableRelationshipsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Schematic.TableRelationships` context.
  """

  @doc """
  Generate a table_relationship.
  """
  def table_relationship_fixture(attrs \\ %{}) do
    {:ok, table_relationship} =
      attrs
      |> Enum.into(%{

      })
      |> Schematic.TableRelationships.create_table_relationship()

    table_relationship
  end
end
