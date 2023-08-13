defmodule Schematic.Triggers do
  @moduledoc """
  The Triggers context.
  """

  import Ecto.Query, warn: false
  alias Schematic.Repo

  alias Schematic.Triggers.SqlTrigger
  alias Schematic.Triggers.SqlFunction
  alias Schematic.Triggers.SqlFunctionInput

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
