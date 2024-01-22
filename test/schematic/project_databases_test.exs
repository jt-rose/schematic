defmodule Schematic.ProjectDatabasesTest do
  use Schematic.DataCase

  alias Schematic.Projects

  describe "project_databases" do
    alias Schematic.Projects.ProjectDatabase

    import Schematic.ProjectDatabasesFixtures

    @invalid_attrs %{name: nil, description: nil, deleted: nil, deleted_at: nil}

    test "list_project_databases/0 returns all project_databases" do
      project_database = project_database_fixture()
      assert Projects.list_project_databases() == [project_database]
    end

    test "get_project_database!/1 returns the project_database with given id" do
      project_database = project_database_fixture()
      assert Projects.get_project_database!(project_database.id) == project_database
    end

    test "create_project_database/1 with valid data creates a project_database" do
      valid_attrs = %{
        name: "some name",
        description: "some description",
        deleted: true,
        deleted_at: ~U[2023-07-20 02:02:00Z]
      }

      assert {:ok, %ProjectDatabase{} = project_database} =
               Projects.create_project_database(valid_attrs)

      assert project_database.name == "some name"
      assert project_database.description == "some description"
      assert project_database.deleted == true
      assert project_database.deleted_at == ~U[2023-07-20 02:02:00Z]
    end

    test "create_project_database/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_project_database(@invalid_attrs)
    end

    test "update_project_database/2 with valid data updates the project_database" do
      project_database = project_database_fixture()

      update_attrs = %{
        name: "some updated name",
        description: "some updated description",
        deleted: false,
        deleted_at: ~U[2023-07-21 02:02:00Z]
      }

      assert {:ok, %ProjectDatabase{} = project_database} =
               Projects.update_project_database(project_database, update_attrs)

      assert project_database.name == "some updated name"
      assert project_database.description == "some updated description"
      assert project_database.deleted == false
      assert project_database.deleted_at == ~U[2023-07-21 02:02:00Z]
    end

    test "update_project_database/2 with invalid data returns error changeset" do
      project_database = project_database_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Projects.update_project_database(project_database, @invalid_attrs)

      assert project_database == Projects.get_project_database!(project_database.id)
    end

    test "delete_project_database/1 deletes the project_database" do
      project_database = project_database_fixture()
      assert {:ok, %ProjectDatabase{}} = Projects.delete_project_database(project_database)

      assert_raise Ecto.NoResultsError, fn ->
        Projects.get_project_database!(project_database.id)
      end
    end

    test "change_project_database/1 returns a project_database changeset" do
      project_database = project_database_fixture()
      assert %Ecto.Changeset{} = Projects.change_project_database(project_database)
    end
  end
end
