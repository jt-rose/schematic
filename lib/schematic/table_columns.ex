defmodule Schematic.TableColumns do
  @moduledoc """
  The TableColumns context.
  """

  import Ecto.Query, warn: false
  alias Schematic.Repo

  alias Schematic.TableColumns.TableColumn

  @doc """
  Returns the list of table_columns.

  ## Examples

      iex> list_table_columns()
      [%TableColumn{}, ...]

  """
  def list_table_columns do
    Repo.all(TableColumn)
  end

  @doc """
  Gets a single table_column.

  Raises `Ecto.NoResultsError` if the Table column does not exist.

  ## Examples

      iex> get_table_column!(123)
      %TableColumn{}

      iex> get_table_column!(456)
      ** (Ecto.NoResultsError)

  """
  def get_table_column!(id), do: Repo.get!(TableColumn, id)

  @doc """
  Creates a table_column.

  ## Examples

      iex> create_table_column(%{field: value})
      {:ok, %TableColumn{}}

      iex> create_table_column(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_table_column(attrs \\ %{}) do
    %TableColumn{}
    |> TableColumn.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a table_column.

  ## Examples

      iex> update_table_column(table_column, %{field: new_value})
      {:ok, %TableColumn{}}

      iex> update_table_column(table_column, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_table_column(%TableColumn{} = table_column, attrs) do
    table_column
    |> TableColumn.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a table_column.

  ## Examples

      iex> delete_table_column(table_column)
      {:ok, %TableColumn{}}

      iex> delete_table_column(table_column)
      {:error, %Ecto.Changeset{}}

  """
  def delete_table_column(%TableColumn{} = table_column) do
    Repo.delete(table_column)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking table_column changes.

  ## Examples

      iex> change_table_column(table_column)
      %Ecto.Changeset{data: %TableColumn{}}

  """
  def change_table_column(%TableColumn{} = table_column, attrs \\ %{}) do
    TableColumn.changeset(table_column, attrs)
  end
end
