defmodule Schematic.TableColumnsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Schematic.TableColumns` context.
  """

  @doc """
  Generate a table_column.
  """
  def table_column_fixture(attrs \\ %{}) do
    {:ok, table_column} =
      attrs
      |> Enum.into(%{
        options: %{},
        description: "some description",
        data_type: "some data_type",
        column_name: "some column_name",
        deleted: true,
        deleted_at: ~U[2023-07-20 02:18:00Z]
      })
      |> Schematic.TableColumns.create_table_column()

    table_column
  end
end
