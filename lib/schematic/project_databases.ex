defmodule Schematic.ProjectDatabases do
  @moduledoc """
  The ProjectDatabases context.
  """

  import Ecto.Query, warn: false
  alias Schematic.Repo

  alias Schematic.ProjectDatabases.ProjectDatabase

  @doc """
  Returns the list of project_databases.

  ## Examples

      iex> list_project_databases()
      [%ProjectDatabase{}, ...]

  """
  def list_project_databases do
    Repo.all(ProjectDatabase)
  end

  @doc """
  Gets a single project_database.

  Raises `Ecto.NoResultsError` if the Project database does not exist.

  ## Examples

      iex> get_project_database!(123)
      %ProjectDatabase{}

      iex> get_project_database!(456)
      ** (Ecto.NoResultsError)

  """
  def get_project_database!(id), do: Repo.get!(ProjectDatabase, id)

  @doc """
  Creates a project_database.

  ## Examples

      iex> create_project_database(%{field: value})
      {:ok, %ProjectDatabase{}}

      iex> create_project_database(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_project_database(attrs \\ %{}) do
    %ProjectDatabase{}
    |> ProjectDatabase.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a project_database.

  ## Examples

      iex> update_project_database(project_database, %{field: new_value})
      {:ok, %ProjectDatabase{}}

      iex> update_project_database(project_database, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_project_database(%ProjectDatabase{} = project_database, attrs) do
    project_database
    |> ProjectDatabase.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a project_database.

  ## Examples

      iex> delete_project_database(project_database)
      {:ok, %ProjectDatabase{}}

      iex> delete_project_database(project_database)
      {:error, %Ecto.Changeset{}}

  """
  def delete_project_database(%ProjectDatabase{} = project_database) do
    Repo.delete(project_database)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking project_database changes.

  ## Examples

      iex> change_project_database(project_database)
      %Ecto.Changeset{data: %ProjectDatabase{}}

  """
  def change_project_database(%ProjectDatabase{} = project_database, attrs \\ %{}) do
    ProjectDatabase.changeset(project_database, attrs)
  end
end
