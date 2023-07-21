defmodule Schematic.GroupMembersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Schematic.GroupMembers` context.
  """

  @doc """
  Generate a group_member.
  """
  def group_member_fixture(attrs \\ %{}) do
    {:ok, group_member} =
      attrs
      |> Enum.into(%{
        active: true,
        permissions: :"owner,admin,member,read-only"
      })
      |> Schematic.GroupMembers.create_group_member()

    group_member
  end
end
