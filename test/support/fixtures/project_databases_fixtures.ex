defmodule Schematic.ProjectDatabasesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Schematic.ProjectDatabases` context.
  """

  @doc """
  Generate a project_database.
  """
  def project_database_fixture(attrs \\ %{}) do
    {:ok, project_database} =
      attrs
      |> Enum.into(%{
        name: "some name",
        description: "some description",
        deleted: true,
        deleted_at: ~U[2023-07-20 02:02:00Z]
      })
      |> Schematic.ProjectDatabases.create_project_database()

    project_database
  end
end
