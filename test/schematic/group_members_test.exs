defmodule Schematic.GroupMembersTest do
  use Schematic.DataCase

  alias Schematic.Groups

  describe "group_members" do
    alias Schematic.Groups.GroupMember

    import Schematic.GroupMembersFixtures

    @invalid_attrs %{active: nil, permissions: nil}

    test "list_group_members/0 returns all group_members" do
      group_member = group_member_fixture()
      assert Groups.list_group_members() == [group_member]
    end

    test "get_group_member!/1 returns the group_member with given id" do
      group_member = group_member_fixture()
      assert Groups.get_group_member!(group_member.id) == group_member
    end

    test "create_group_member/1 with valid data creates a group_member" do
      valid_attrs = %{active: true, permissions: :"owner,admin,member,read-only"}

      assert {:ok, %GroupMember{} = group_member} = Groups.create_group_member(valid_attrs)
      assert group_member.active == true
      assert group_member.permissions == :"owner,admin,member,read-only"
    end

    test "create_group_member/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Groups.create_group_member(@invalid_attrs)
    end

    test "update_group_member/2 with valid data updates the group_member" do
      group_member = group_member_fixture()
      update_attrs = %{active: false, permissions: :"owner,admin,member,read-only"}

      assert {:ok, %GroupMember{} = group_member} =
               Groups.update_group_member(group_member, update_attrs)

      assert group_member.active == false
      assert group_member.permissions == :"owner,admin,member,read-only"
    end

    test "update_group_member/2 with invalid data returns error changeset" do
      group_member = group_member_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Groups.update_group_member(group_member, @invalid_attrs)

      assert group_member == Groups.get_group_member!(group_member.id)
    end

    test "delete_group_member/1 deletes the group_member" do
      group_member = group_member_fixture()
      assert {:ok, %GroupMember{}} = Groups.delete_group_member(group_member)
      assert_raise Ecto.NoResultsError, fn -> Groups.get_group_member!(group_member.id) end
    end

    test "change_group_member/1 returns a group_member changeset" do
      group_member = group_member_fixture()
      assert %Ecto.Changeset{} = Groups.change_group_member(group_member)
    end
  end
end
