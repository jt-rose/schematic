defmodule Schematic.ProjectsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Schematic.Projects` context.
  """

  @doc """
  Generate a project.
  """
  def project_fixture(attrs \\ %{}) do
    {:ok, project} =
      attrs
      |> Enum.into(%{
        name: "some name",
        public: true,
        description: "some description",
        deleted: true,
        deleted_at: ~U[2023-07-20 01:58:00Z]
      })
      |> Schematic.Projects.create_project()

    project
  end
end
