defmodule Schematic.TableIndexes do
  @moduledoc """
  The TableIndexes context.
  """

  import Ecto.Query, warn: false
  alias Schematic.Repo

  alias Schematic.TableIndexes.TableIndex

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
end
