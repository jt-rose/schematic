defmodule Schematic.SqlTriggers do
  @moduledoc """
  The SqlTriggers context.
  """

  import Ecto.Query, warn: false
  alias Schematic.Repo

  alias Schematic.SqlTriggers.SqlTrigger

  @doc """
  Returns the list of sql_triggers.

  ## Examples

      iex> list_sql_triggers()
      [%SqlTrigger{}, ...]

  """
  def list_sql_triggers do
    Repo.all(SqlTrigger)
  end

  @doc """
  Gets a single sql_trigger.

  Raises `Ecto.NoResultsError` if the Sql trigger does not exist.

  ## Examples

      iex> get_sql_trigger!(123)
      %SqlTrigger{}

      iex> get_sql_trigger!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sql_trigger!(id), do: Repo.get!(SqlTrigger, id)

  @doc """
  Creates a sql_trigger.

  ## Examples

      iex> create_sql_trigger(%{field: value})
      {:ok, %SqlTrigger{}}

      iex> create_sql_trigger(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sql_trigger(attrs \\ %{}) do
    %SqlTrigger{}
    |> SqlTrigger.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sql_trigger.

  ## Examples

      iex> update_sql_trigger(sql_trigger, %{field: new_value})
      {:ok, %SqlTrigger{}}

      iex> update_sql_trigger(sql_trigger, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sql_trigger(%SqlTrigger{} = sql_trigger, attrs) do
    sql_trigger
    |> SqlTrigger.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a sql_trigger.

  ## Examples

      iex> delete_sql_trigger(sql_trigger)
      {:ok, %SqlTrigger{}}

      iex> delete_sql_trigger(sql_trigger)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sql_trigger(%SqlTrigger{} = sql_trigger) do
    Repo.delete(sql_trigger)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sql_trigger changes.

  ## Examples

      iex> change_sql_trigger(sql_trigger)
      %Ecto.Changeset{data: %SqlTrigger{}}

  """
  def change_sql_trigger(%SqlTrigger{} = sql_trigger, attrs \\ %{}) do
    SqlTrigger.changeset(sql_trigger, attrs)
  end
end
