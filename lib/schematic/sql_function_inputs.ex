defmodule Schematic.SqlFunctionInputs do
  @moduledoc """
  The SqlFunctionInputs context.
  """

  import Ecto.Query, warn: false
  alias Schematic.Repo

  alias Schematic.SqlFunctionInputs.SqlFunctionInput

  @doc """
  Returns the list of sql_function_inputs.

  ## Examples

      iex> list_sql_function_inputs()
      [%SqlFunctionInput{}, ...]

  """
  def list_sql_function_inputs do
    Repo.all(SqlFunctionInput)
  end

  @doc """
  Gets a single sql_function_input.

  Raises `Ecto.NoResultsError` if the Sql function input does not exist.

  ## Examples

      iex> get_sql_function_input!(123)
      %SqlFunctionInput{}

      iex> get_sql_function_input!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sql_function_input!(id), do: Repo.get!(SqlFunctionInput, id)

  @doc """
  Creates a sql_function_input.

  ## Examples

      iex> create_sql_function_input(%{field: value})
      {:ok, %SqlFunctionInput{}}

      iex> create_sql_function_input(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sql_function_input(attrs \\ %{}) do
    %SqlFunctionInput{}
    |> SqlFunctionInput.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sql_function_input.

  ## Examples

      iex> update_sql_function_input(sql_function_input, %{field: new_value})
      {:ok, %SqlFunctionInput{}}

      iex> update_sql_function_input(sql_function_input, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sql_function_input(%SqlFunctionInput{} = sql_function_input, attrs) do
    sql_function_input
    |> SqlFunctionInput.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a sql_function_input.

  ## Examples

      iex> delete_sql_function_input(sql_function_input)
      {:ok, %SqlFunctionInput{}}

      iex> delete_sql_function_input(sql_function_input)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sql_function_input(%SqlFunctionInput{} = sql_function_input) do
    Repo.delete(sql_function_input)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sql_function_input changes.

  ## Examples

      iex> change_sql_function_input(sql_function_input)
      %Ecto.Changeset{data: %SqlFunctionInput{}}

  """
  def change_sql_function_input(%SqlFunctionInput{} = sql_function_input, attrs \\ %{}) do
    SqlFunctionInput.changeset(sql_function_input, attrs)
  end
end
