defmodule Schematic.IndexColumns do
  @moduledoc """
  The IndexColumns context.
  """

  import Ecto.Query, warn: false
  alias Schematic.Repo

  alias Schematic.IndexColumns.IndexColumn

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
