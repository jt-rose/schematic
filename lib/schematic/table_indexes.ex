defmodule Schematic.TableIndexes do
  @moduledoc """
  The TableIndexes context.
  """

  import Ecto.Query, warn: false
  alias Schematic.Repo

  alias Schematic.TableIndexes.TableIndex
  alias Schematic.TableIndexes.IndexColumn

  @doc """
  Returns the list of table_indexes.

  ## Examples

      iex> list_table_indexes()
      [%TableIndex{}, ...]

  """
  def list_table_indexes do
    Repo.all(TableIndex)
  end

  @doc """
  Gets a single table_index.

  Raises `Ecto.NoResultsError` if the Table index does not exist.

  ## Examples

      iex> get_table_index!(123)
      %TableIndex{}

      iex> get_table_index!(456)
      ** (Ecto.NoResultsError)

  """
  def get_table_index!(id), do: Repo.get!(TableIndex, id)

  @doc """
  Creates a table_index.

  ## Examples

      iex> create_table_index(%{field: value})
      {:ok, %TableIndex{}}

      iex> create_table_index(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_table_index(attrs \\ %{}) do
    %TableIndex{}
    |> TableIndex.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a table_index.

  ## Examples

      iex> update_table_index(table_index, %{field: new_value})
      {:ok, %TableIndex{}}

      iex> update_table_index(table_index, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_table_index(%TableIndex{} = table_index, attrs) do
    table_index
    |> TableIndex.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a table_index.

  ## Examples

      iex> delete_table_index(table_index)
      {:ok, %TableIndex{}}

      iex> delete_table_index(table_index)
      {:error, %Ecto.Changeset{}}

  """
  def delete_table_index(%TableIndex{} = table_index) do
    Repo.delete(table_index)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking table_index changes.

  ## Examples

      iex> change_table_index(table_index)
      %Ecto.Changeset{data: %TableIndex{}}

  """
  def change_table_index(%TableIndex{} = table_index, attrs \\ %{}) do
    TableIndex.changeset(table_index, attrs)
  end

  @doc """
  Returns the list of index_columns.

  ## Examples

      iex> list_index_columns()
      [%IndexColumn{}, ...]

  """
  def list_index_columns do
    Repo.all(IndexColumn)
  end

  @doc """
  Gets a single index_column.

  Raises `Ecto.NoResultsError` if the Index column does not exist.

  ## Examples

      iex> get_index_column!(123)
      %IndexColumn{}

      iex> get_index_column!(456)
      ** (Ecto.NoResultsError)

  """
  def get_index_column!(id), do: Repo.get!(IndexColumn, id)

  @doc """
  Creates a index_column.

  ## Examples

      iex> create_index_column(%{field: value})
      {:ok, %IndexColumn{}}

      iex> create_index_column(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_index_column(attrs \\ %{}) do
    %IndexColumn{}
    |> IndexColumn.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a index_column.

  ## Examples

      iex> update_index_column(index_column, %{field: new_value})
      {:ok, %IndexColumn{}}

      iex> update_index_column(index_column, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_index_column(%IndexColumn{} = index_column, attrs) do
    index_column
    |> IndexColumn.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a index_column.

  ## Examples

      iex> delete_index_column(index_column)
      {:ok, %IndexColumn{}}

      iex> delete_index_column(index_column)
      {:error, %Ecto.Changeset{}}

  """
  def delete_index_column(%IndexColumn{} = index_column) do
    Repo.delete(index_column)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking index_column changes.

  ## Examples

      iex> change_index_column(index_column)
      %Ecto.Changeset{data: %IndexColumn{}}

  """
  def change_index_column(%IndexColumn{} = index_column, attrs \\ %{}) do
    IndexColumn.changeset(index_column, attrs)
  end
end
