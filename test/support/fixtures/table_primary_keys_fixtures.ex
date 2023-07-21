defmodule Schematic.TablePrimaryKeysFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Schematic.TablePrimaryKeys` context.
  """

  @doc """
  Generate a table_primary_key.
  """
  def table_primary_key_fixture(attrs \\ %{}) do
    {:ok, table_primary_key} =
      attrs
      |> Enum.into(%{

      })
      |> Schematic.TablePrimaryKeys.create_table_primary_key()

    table_primary_key
  end
end
