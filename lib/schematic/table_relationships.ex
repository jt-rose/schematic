defmodule Schematic.TableRelationships do
  @moduledoc """
  The TableRelationships context.
  """

  import Ecto.Query, warn: false
  alias Schematic.Repo

  alias Schematic.TableRelationships.TableRelationship

  @doc """
  Returns the list of table_relationships.

  ## Examples

      iex> list_table_relationships()
      [%TableRelationship{}, ...]

  """
  def list_table_relationships do
    Repo.all(TableRelationship)
  end

  @doc """
  Gets a single table_relationship.

  Raises `Ecto.NoResultsError` if the Table relationship does not exist.

  ## Examples

      iex> get_table_relationship!(123)
      %TableRelationship{}

      iex> get_table_relationship!(456)
      ** (Ecto.NoResultsError)

  """
  def get_table_relationship!(id), do: Repo.get!(TableRelationship, id)

  @doc """
  Creates a table_relationship.

  ## Examples

      iex> create_table_relationship(%{field: value})
      {:ok, %TableRelationship{}}

      iex> create_table_relationship(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_table_relationship(attrs \\ %{}) do
    %TableRelationship{}
    |> TableRelationship.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a table_relationship.

  ## Examples

      iex> update_table_relationship(table_relationship, %{field: new_value})
      {:ok, %TableRelationship{}}

      iex> update_table_relationship(table_relationship, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_table_relationship(%TableRelationship{} = table_relationship, attrs) do
    table_relationship
    |> TableRelationship.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a table_relationship.

  ## Examples

      iex> delete_table_relationship(table_relationship)
      {:ok, %TableRelationship{}}

      iex> delete_table_relationship(table_relationship)
      {:error, %Ecto.Changeset{}}

  """
  def delete_table_relationship(%TableRelationship{} = table_relationship) do
    Repo.delete(table_relationship)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking table_relationship changes.

  ## Examples

      iex> change_table_relationship(table_relationship)
      %Ecto.Changeset{data: %TableRelationship{}}

  """
  def change_table_relationship(%TableRelationship{} = table_relationship, attrs \\ %{}) do
    TableRelationship.changeset(table_relationship, attrs)
  end
end
