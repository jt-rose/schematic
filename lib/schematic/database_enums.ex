defmodule Schematic.DatabaseEnums do
  @moduledoc """
  The DatabaseEnums context.
  """

  import Ecto.Query, warn: false
  alias Schematic.Repo

  alias Schematic.DatabaseEnums.DatabaseEnum
  alias Schematic.DatabaseEnums.EnumValue
  alias Schematic.DatabaseEnums.EnumColumn

  @doc """
  Returns the list of database_enums.

  ## Examples

      iex> list_database_enums()
      [%DatabaseEnum{}, ...]

  """
  def list_database_enums do
    Repo.all(DatabaseEnum)
  end

  @doc """
  Gets a single database_enum.

  Raises `Ecto.NoResultsError` if the Database enum does not exist.

  ## Examples

      iex> get_database_enum!(123)
      %DatabaseEnum{}

      iex> get_database_enum!(456)
      ** (Ecto.NoResultsError)

  """
  def get_database_enum!(id), do: Repo.get!(DatabaseEnum, id)

  @doc """
  Creates a database_enum.

  ## Examples

      iex> create_database_enum(%{field: value})
      {:ok, %DatabaseEnum{}}

      iex> create_database_enum(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_database_enum(attrs \\ %{}) do
    %DatabaseEnum{}
    |> DatabaseEnum.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a database_enum.

  ## Examples

      iex> update_database_enum(database_enum, %{field: new_value})
      {:ok, %DatabaseEnum{}}

      iex> update_database_enum(database_enum, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_database_enum(%DatabaseEnum{} = database_enum, attrs) do
    database_enum
    |> DatabaseEnum.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a database_enum.

  ## Examples

      iex> delete_database_enum(database_enum)
      {:ok, %DatabaseEnum{}}

      iex> delete_database_enum(database_enum)
      {:error, %Ecto.Changeset{}}

  """
  def delete_database_enum(%DatabaseEnum{} = database_enum) do
    Repo.delete(database_enum)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking database_enum changes.

  ## Examples

      iex> change_database_enum(database_enum)
      %Ecto.Changeset{data: %DatabaseEnum{}}

  """
  def change_database_enum(%DatabaseEnum{} = database_enum, attrs \\ %{}) do
    DatabaseEnum.changeset(database_enum, attrs)
  end

  @doc """
  Returns the list of enum_values.

  ## Examples

      iex> list_enum_values()
      [%EnumValues{}, ...]

  """
  def list_enum_values do
    Repo.all(EnumValues)
  end

  @doc """
  Gets a single enum_values.

  Raises `Ecto.NoResultsError` if the Enum values does not exist.

  ## Examples

      iex> get_enum_values!(123)
      %EnumValues{}

      iex> get_enum_values!(456)
      ** (Ecto.NoResultsError)

  """
  def get_enum_values!(id), do: Repo.get!(EnumValues, id)

  @doc """
  Creates a enum_values.

  ## Examples

      iex> create_enum_values(%{field: value})
      {:ok, %EnumValues{}}

      iex> create_enum_values(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_enum_values(attrs \\ %{}) do
    %EnumValue{}
    |> EnumValue.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a enum_values.

  ## Examples

      iex> update_enum_values(enum_values, %{field: new_value})
      {:ok, %EnumValues{}}

      iex> update_enum_values(enum_values, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_enum_values(%EnumValue{} = enum_values, attrs) do
    enum_values
    |> EnumValue.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a enum_values.

  ## Examples

      iex> delete_enum_values(enum_values)
      {:ok, %EnumValues{}}

      iex> delete_enum_values(enum_values)
      {:error, %Ecto.Changeset{}}

  """
  def delete_enum_values(%EnumValue{} = enum_values) do
    Repo.delete(enum_values)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking enum_values changes.

  ## Examples

      iex> change_enum_values(enum_values)
      %Ecto.Changeset{data: %EnumValues{}}

  """
  def change_enum_values(%EnumValue{} = enum_values, attrs \\ %{}) do
    EnumValue.changeset(enum_values, attrs)
  end

  @doc """
  Returns the list of enum_columns.

  ## Examples

      iex> list_enum_columns()
      [%EnumColumn{}, ...]

  """
  def list_enum_columns do
    Repo.all(EnumColumn)
  end

  @doc """
  Gets a single enum_column.

  Raises `Ecto.NoResultsError` if the Enum column does not exist.

  ## Examples

      iex> get_enum_column!(123)
      %EnumColumn{}

      iex> get_enum_column!(456)
      ** (Ecto.NoResultsError)

  """
  def get_enum_column!(id), do: Repo.get!(EnumColumn, id)

  @doc """
  Creates a enum_column.

  ## Examples

      iex> create_enum_column(%{field: value})
      {:ok, %EnumColumn{}}

      iex> create_enum_column(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_enum_column(attrs \\ %{}) do
    %EnumColumn{}
    |> EnumColumn.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a enum_column.

  ## Examples

      iex> update_enum_column(enum_column, %{field: new_value})
      {:ok, %EnumColumn{}}

      iex> update_enum_column(enum_column, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_enum_column(%EnumColumn{} = enum_column, attrs) do
    enum_column
    |> EnumColumn.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a enum_column.

  ## Examples

      iex> delete_enum_column(enum_column)
      {:ok, %EnumColumn{}}

      iex> delete_enum_column(enum_column)
      {:error, %Ecto.Changeset{}}

  """
  def delete_enum_column(%EnumColumn{} = enum_column) do
    Repo.delete(enum_column)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking enum_column changes.

  ## Examples

      iex> change_enum_column(enum_column)
      %Ecto.Changeset{data: %EnumColumn{}}

  """
  def change_enum_column(%EnumColumn{} = enum_column, attrs \\ %{}) do
    EnumColumn.changeset(enum_column, attrs)
  end
end
