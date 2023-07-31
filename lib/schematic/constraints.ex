defmodule Schematic.Constraints do
  @moduledoc """
  The Constraints context.
  """

  import Ecto.Query, warn: false
  alias Schematic.Repo

  alias Schematic.Constraints.Constraint

  @doc """
  Returns the list of constraints.

  ## Examples

      iex> list_constraints()
      [%Constraint{}, ...]

  """
  def list_constraints do
    Repo.all(Constraint)
  end

  @doc """
  Gets a single constraint.

  Raises `Ecto.NoResultsError` if the Constraint does not exist.

  ## Examples

      iex> get_constraint!(123)
      %Constraint{}

      iex> get_constraint!(456)
      ** (Ecto.NoResultsError)

  """
  def get_constraint!(id), do: Repo.get!(Constraint, id)

  @doc """
  Creates a constraint.

  ## Examples

      iex> create_constraint(%{field: value})
      {:ok, %Constraint{}}

      iex> create_constraint(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_constraint(attrs \\ %{}) do
    %Constraint{}
    |> Constraint.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a constraint.

  ## Examples

      iex> update_constraint(constraint, %{field: new_value})
      {:ok, %Constraint{}}

      iex> update_constraint(constraint, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_constraint(%Constraint{} = constraint, attrs) do
    constraint
    |> Constraint.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a constraint.

  ## Examples

      iex> delete_constraint(constraint)
      {:ok, %Constraint{}}

      iex> delete_constraint(constraint)
      {:error, %Ecto.Changeset{}}

  """
  def delete_constraint(%Constraint{} = constraint) do
    Repo.delete(constraint)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking constraint changes.

  ## Examples

      iex> change_constraint(constraint)
      %Ecto.Changeset{data: %Constraint{}}

  """
  def change_constraint(%Constraint{} = constraint, attrs \\ %{}) do
    Constraint.changeset(constraint, attrs)
  end
end
