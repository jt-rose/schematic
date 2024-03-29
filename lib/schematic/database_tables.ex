defmodule Schematic.DatabaseTables do
  @moduledoc """
  The DatabaseTables context.
  """

  import Ecto.Query, warn: false
  alias Schematic.Repo

  alias Schematic.DatabaseTables.DatabaseTable

  @doc """
  Returns the list of database_tables.

  ## Examples

      iex> list_database_tables()
      [%DatabaseTable{}, ...]

  """
  def list_database_tables do
    Repo.all(DatabaseTable)
  end

  @doc """
  Gets a single database_table.

  Raises `Ecto.NoResultsError` if the Database table does not exist.

  ## Examples

      iex> get_database_table!(123)
      %DatabaseTable{}

      iex> get_database_table!(456)
      ** (Ecto.NoResultsError)

  """
  def get_database_table!(id), do: Repo.get!(DatabaseTable, id)

  @doc """
  Creates a database_table.

  ## Examples

      iex> create_database_table(%{field: value})
      {:ok, %DatabaseTable{}}

      iex> create_database_table(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_database_table(attrs \\ %{}) do
    %DatabaseTable{}
    |> DatabaseTable.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a database_table.

  ## Examples

      iex> update_database_table(database_table, %{field: new_value})
      {:ok, %DatabaseTable{}}

      iex> update_database_table(database_table, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_database_table(%DatabaseTable{} = database_table, attrs) do
    database_table
    |> DatabaseTable.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a database_table.

  ## Examples

      iex> delete_database_table(database_table)
      {:ok, %DatabaseTable{}}

      iex> delete_database_table(database_table)
      {:error, %Ecto.Changeset{}}

  """
  def delete_database_table(%DatabaseTable{} = database_table) do
    Repo.delete(database_table)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking database_table changes.

  ## Examples

      iex> change_database_table(database_table)
      %Ecto.Changeset{data: %DatabaseTable{}}

  """
  def change_database_table(%DatabaseTable{} = database_table, attrs \\ %{}) do
    DatabaseTable.changeset(database_table, attrs)
  end

  def repos_and_bump(table_id, {_c, r}) when r == 7 do
    buffer = 20 - r

    Repo.transaction(fn ->
      upd =
        from Schematic.DatabaseTables.DatabaseTable,
          where: [id: ^table_id],
          update: [set: [grid_row_start: ^r]]

      {1, _} = Repo.update_all(upd, [])

      q =
        from Schematic.DatabaseTables.DatabaseTable,
          where: [project_database_id: 1],
          update: [inc: [grid_row_start: ^buffer]]

      {_a, _} = Repo.update_all(q, [])
      # bump()
    end)
  end

  def bump(num) do
    q =
      from Schematic.DatabaseTables.DatabaseTable,
        where: [project_database_id: 1],
        update: [inc: [grid_column_start: ^num]]

    Repo.update_all(q, [])
  end
end
