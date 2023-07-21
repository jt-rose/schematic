defmodule Schematic.GroupsTest do
  use Schematic.DataCase

  alias Schematic.Groups

  describe "groups" do
    alias Schematic.Groups.Group

    import Schematic.GroupsFixtures

    @invalid_attrs %{active: nil, name: nil, public: nil, description: nil, deleted: nil, deleted_at: nil}

    test "list_groups/0 returns all groups" do
      group = group_fixture()
      assert Groups.list_groups() == [group]
    end

    test "get_group!/1 returns the group with given id" do
      group = group_fixture()
      assert Groups.get_group!(group.id) == group
    end

    test "create_group/1 with valid data creates a group" do
      valid_attrs = %{active: true, name: "some name", public: true, description: "some description", deleted: true, deleted_at: ~U[2023-07-20 01:43:00Z]}

      assert {:ok, %Group{} = group} = Groups.create_group(valid_attrs)
      assert group.active == true
      assert group.name == "some name"
      assert group.public == true
      assert group.description == "some description"
      assert group.deleted == true
      assert group.deleted_at == ~U[2023-07-20 01:43:00Z]
    end

    test "create_group/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Groups.create_group(@invalid_attrs)
    end

    test "update_group/2 with valid data updates the group" do
      group = group_fixture()
      update_attrs = %{active: false, name: "some updated name", public: false, description: "some updated description", deleted: false, deleted_at: ~U[2023-07-21 01:43:00Z]}

      assert {:ok, %Group{} = group} = Groups.update_group(group, update_attrs)
      assert group.active == false
      assert group.name == "some updated name"
      assert group.public == false
      assert group.description == "some updated description"
      assert group.deleted == false
      assert group.deleted_at == ~U[2023-07-21 01:43:00Z]
    end

    test "update_group/2 with invalid data returns error changeset" do
      group = group_fixture()
      assert {:error, %Ecto.Changeset{}} = Groups.update_group(group, @invalid_attrs)
      assert group == Groups.get_group!(group.id)
    end

    test "delete_group/1 deletes the group" do
      group = group_fixture()
      assert {:ok, %Group{}} = Groups.delete_group(group)
      assert_raise Ecto.NoResultsError, fn -> Groups.get_group!(group.id) end
    end

    test "change_group/1 returns a group changeset" do
      group = group_fixture()
      assert %Ecto.Changeset{} = Groups.change_group(group)
    end
  end
end
