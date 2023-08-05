defmodule Schematic.SqlTriggersTest do
  use Schematic.DataCase

  alias Schematic.SqlTriggers

  describe "sql_triggers" do
    alias Schematic.SqlTriggers.SqlTrigger

    import Schematic.SqlTriggersFixtures

    @invalid_attrs %{name: nil, level: nil, event: nil, timing: nil}

    test "list_sql_triggers/0 returns all sql_triggers" do
      sql_trigger = sql_trigger_fixture()
      assert SqlTriggers.list_sql_triggers() == [sql_trigger]
    end

    test "get_sql_trigger!/1 returns the sql_trigger with given id" do
      sql_trigger = sql_trigger_fixture()
      assert SqlTriggers.get_sql_trigger!(sql_trigger.id) == sql_trigger
    end

    test "create_sql_trigger/1 with valid data creates a sql_trigger" do
      valid_attrs = %{name: "some name", level: :row, event: :insert, timing: :before}

      assert {:ok, %SqlTrigger{} = sql_trigger} = SqlTriggers.create_sql_trigger(valid_attrs)
      assert sql_trigger.name == "some name"
      assert sql_trigger.level == :row
      assert sql_trigger.event == :insert
      assert sql_trigger.timing == :before
    end

    test "create_sql_trigger/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SqlTriggers.create_sql_trigger(@invalid_attrs)
    end

    test "update_sql_trigger/2 with valid data updates the sql_trigger" do
      sql_trigger = sql_trigger_fixture()
      update_attrs = %{name: "some updated name", level: :statement, event: :update, timing: :after}

      assert {:ok, %SqlTrigger{} = sql_trigger} = SqlTriggers.update_sql_trigger(sql_trigger, update_attrs)
      assert sql_trigger.name == "some updated name"
      assert sql_trigger.level == :statement
      assert sql_trigger.event == :update
      assert sql_trigger.timing == :after
    end

    test "update_sql_trigger/2 with invalid data returns error changeset" do
      sql_trigger = sql_trigger_fixture()
      assert {:error, %Ecto.Changeset{}} = SqlTriggers.update_sql_trigger(sql_trigger, @invalid_attrs)
      assert sql_trigger == SqlTriggers.get_sql_trigger!(sql_trigger.id)
    end

    test "delete_sql_trigger/1 deletes the sql_trigger" do
      sql_trigger = sql_trigger_fixture()
      assert {:ok, %SqlTrigger{}} = SqlTriggers.delete_sql_trigger(sql_trigger)
      assert_raise Ecto.NoResultsError, fn -> SqlTriggers.get_sql_trigger!(sql_trigger.id) end
    end

    test "change_sql_trigger/1 returns a sql_trigger changeset" do
      sql_trigger = sql_trigger_fixture()
      assert %Ecto.Changeset{} = SqlTriggers.change_sql_trigger(sql_trigger)
    end
  end
end
