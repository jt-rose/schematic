defmodule Schematic.SqlTriggersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Schematic.SqlTriggers` context.
  """

  @doc """
  Generate a sql_trigger.
  """
  def sql_trigger_fixture(attrs \\ %{}) do
    {:ok, sql_trigger} =
      attrs
      |> Enum.into(%{
        name: "some name",
        level: :row,
        event: :insert,
        timing: :before
      })
      |> Schematic.SqlTriggers.create_sql_trigger()

    sql_trigger
  end
end
