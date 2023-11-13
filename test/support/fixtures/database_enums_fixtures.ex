defmodule Schematic.DatabaseEnumsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Schematic.DatabaseEnums` context.
  """

  @doc """
  Generate a database_enum.
  """
  def database_enum_fixture(attrs \\ %{}) do
    {:ok, database_enum} =
      attrs
      |> Enum.into(%{
        name: "some name",
        description: "some description"
      })
      |> Schematic.DatabaseEnums.create_database_enum()

    database_enum
  end

  @doc """
  Generate a enum_values.
  """
  def enum_values_fixture(attrs \\ %{}) do
    {:ok, enum_values} =
      attrs
      |> Enum.into(%{
        value: "some value"
      })
      |> Schematic.DatabaseEnums.create_enum_values()

    enum_values
  end

  @doc """
  Generate a enum_column.
  """
  def enum_column_fixture(attrs \\ %{}) do
    {:ok, enum_column} =
      attrs
      |> Enum.into(%{
        description: "some description",
        is_unique: true,
        column_name: "some column_name",
        array_depth: 42,
        is_primary_key: true,
        is_nullable: true,
        deleted: true,
        deleted_at: ~U[2023-09-04 17:06:00Z]
      })
      |> Schematic.DatabaseEnums.create_enum_column()

    enum_column
  end
end
