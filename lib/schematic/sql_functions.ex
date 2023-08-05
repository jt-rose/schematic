defmodule Schematic.SqlFunctions do
  @moduledoc """
  The SqlFunctions context.
  """

  import Ecto.Query, warn: false
  alias Schematic.Repo

  alias Schematic.SqlFunctions.SqlFunction

  @doc """
  Returns the list of sql_functions.

  ## Examples

      iex> list_sql_functions()
      [%SqlFunction{}, ...]

  """
  def list_sql_functions do
    Repo.all(SqlFunction)
  end

  @doc """
  Gets a single sql_function.

  Raises `Ecto.NoResultsError` if the Sql function does not exist.

  ## Examples

      iex> get_sql_function!(123)
      %SqlFunction{}

      iex> get_sql_function!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sql_function!(id), do: Repo.get!(SqlFunction, id)

  @doc """
  Creates a sql_function.

  ## Examples

      iex> create_sql_function(%{field: value})
      {:ok, %SqlFunction{}}

      iex> create_sql_function(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sql_function(attrs \\ %{}) do
    %SqlFunction{}
    |> SqlFunction.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sql_function.

  ## Examples

      iex> update_sql_function(sql_function, %{field: new_value})
      {:ok, %SqlFunction{}}

      iex> update_sql_function(sql_function, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sql_function(%SqlFunction{} = sql_function, attrs) do
    sql_function
    |> SqlFunction.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a sql_function.

  ## Examples

      iex> delete_sql_function(sql_function)
      {:ok, %SqlFunction{}}

      iex> delete_sql_function(sql_function)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sql_function(%SqlFunction{} = sql_function) do
    Repo.delete(sql_function)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sql_function changes.

  ## Examples

      iex> change_sql_function(sql_function)
      %Ecto.Changeset{data: %SqlFunction{}}

  """
  def change_sql_function(%SqlFunction{} = sql_function, attrs \\ %{}) do
    SqlFunction.changeset(sql_function, attrs)
  end
end
