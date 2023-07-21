defmodule Schematic.TablePrimaryKeys do
  @moduledoc """
  The TablePrimaryKeys context.
  """

  import Ecto.Query, warn: false
  alias Schematic.Repo

  alias Schematic.TablePrimaryKeys.TablePrimaryKey

  @doc """
  Returns the list of table_primary_keys.

  ## Examples

      iex> list_table_primary_keys()
      [%TablePrimaryKey{}, ...]

  """
  def list_table_primary_keys do
    Repo.all(TablePrimaryKey)
  end

  @doc """
  Gets a single table_primary_key.

  Raises `Ecto.NoResultsError` if the Table primary key does not exist.

  ## Examples

      iex> get_table_primary_key!(123)
      %TablePrimaryKey{}

      iex> get_table_primary_key!(456)
      ** (Ecto.NoResultsError)

  """
  def get_table_primary_key!(id), do: Repo.get!(TablePrimaryKey, id)

  @doc """
  Creates a table_primary_key.

  ## Examples

      iex> create_table_primary_key(%{field: value})
      {:ok, %TablePrimaryKey{}}

      iex> create_table_primary_key(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_table_primary_key(attrs \\ %{}) do
    %TablePrimaryKey{}
    |> TablePrimaryKey.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a table_primary_key.

  ## Examples

      iex> update_table_primary_key(table_primary_key, %{field: new_value})
      {:ok, %TablePrimaryKey{}}

      iex> update_table_primary_key(table_primary_key, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_table_primary_key(%TablePrimaryKey{} = table_primary_key, attrs) do
    table_primary_key
    |> TablePrimaryKey.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a table_primary_key.

  ## Examples

      iex> delete_table_primary_key(table_primary_key)
      {:ok, %TablePrimaryKey{}}

      iex> delete_table_primary_key(table_primary_key)
      {:error, %Ecto.Changeset{}}

  """
  def delete_table_primary_key(%TablePrimaryKey{} = table_primary_key) do
    Repo.delete(table_primary_key)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking table_primary_key changes.

  ## Examples

      iex> change_table_primary_key(table_primary_key)
      %Ecto.Changeset{data: %TablePrimaryKey{}}

  """
  def change_table_primary_key(%TablePrimaryKey{} = table_primary_key, attrs \\ %{}) do
    TablePrimaryKey.changeset(table_primary_key, attrs)
  end
end
