defmodule Schematic.ConstraintColumns do
  @moduledoc """
  The ConstraintColumns context.
  """

  import Ecto.Query, warn: false
  alias Schematic.Repo

  alias Schematic.ConstraintColumns.ConstraintColumn

  @doc """
  Returns the list of constraint_columns.

  ## Examples

      iex> list_constraint_columns()
      [%ConstraintColumn{}, ...]

  """
  def list_constraint_columns do
    Repo.all(ConstraintColumn)
  end

  @doc """
  Gets a single constraint_column.

  Raises `Ecto.NoResultsError` if the Constraint column does not exist.

  ## Examples

      iex> get_constraint_column!(123)
      %ConstraintColumn{}

      iex> get_constraint_column!(456)
      ** (Ecto.NoResultsError)

  """
  def get_constraint_column!(id), do: Repo.get!(ConstraintColumn, id)

  @doc """
  Creates a constraint_column.

  ## Examples

      iex> create_constraint_column(%{field: value})
      {:ok, %ConstraintColumn{}}

      iex> create_constraint_column(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_constraint_column(attrs \\ %{}) do
    %ConstraintColumn{}
    |> ConstraintColumn.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a constraint_column.

  ## Examples

      iex> update_constraint_column(constraint_column, %{field: new_value})
      {:ok, %ConstraintColumn{}}

      iex> update_constraint_column(constraint_column, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_constraint_column(%ConstraintColumn{} = constraint_column, attrs) do
    constraint_column
    |> ConstraintColumn.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a constraint_column.

  ## Examples

      iex> delete_constraint_column(constraint_column)
      {:ok, %ConstraintColumn{}}

      iex> delete_constraint_column(constraint_column)
      {:error, %Ecto.Changeset{}}

  """
  def delete_constraint_column(%ConstraintColumn{} = constraint_column) do
    Repo.delete(constraint_column)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking constraint_column changes.

  ## Examples

      iex> change_constraint_column(constraint_column)
      %Ecto.Changeset{data: %ConstraintColumn{}}

  """
  def change_constraint_column(%ConstraintColumn{} = constraint_column, attrs \\ %{}) do
    ConstraintColumn.changeset(constraint_column, attrs)
  end
end
