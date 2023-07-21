defmodule Schematic.DatabaseTablesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Schematic.DatabaseTables` context.
  """

  @doc """
  Generate a database_table.
  """
  def database_table_fixture(attrs \\ %{}) do
    {:ok, database_table} =
      attrs
      |> Enum.into(%{
        name: "some name",
        description: "some description",
        deleted: true,
        deleted_at: ~U[2023-07-20 02:06:00Z]
      })
      |> Schematic.DatabaseTables.create_database_table()

    database_table
  end
end
