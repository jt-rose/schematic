defmodule Schematic.GroupsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Schematic.Groups` context.
  """

  @doc """
  Generate a group.
  """
  def group_fixture(attrs \\ %{}) do
    {:ok, group} =
      attrs
      |> Enum.into(%{
        active: true,
        name: "some name",
        public: true,
        description: "some description",
        deleted: true,
        deleted_at: ~U[2023-07-20 01:43:00Z]
      })
      |> Schematic.Groups.create_group()

    group
  end
end
