defmodule Schematic.GeneratedInputs do
  @moduledoc """
  The GeneratedInputs context.
  """

  import Ecto.Query, warn: false
  alias Schematic.Repo

  alias Schematic.GeneratedInputs.GeneratedInput

  @doc """
  Returns the list of generated_inputs.

  ## Examples

      iex> list_generated_inputs()
      [%GeneratedInput{}, ...]

  """
  def list_generated_inputs do
    Repo.all(GeneratedInput)
  end

  @doc """
  Gets a single generated_input.

  Raises `Ecto.NoResultsError` if the Generated input does not exist.

  ## Examples

      iex> get_generated_input!(123)
      %GeneratedInput{}

      iex> get_generated_input!(456)
      ** (Ecto.NoResultsError)

  """
  def get_generated_input!(id), do: Repo.get!(GeneratedInput, id)

  @doc """
  Creates a generated_input.

  ## Examples

      iex> create_generated_input(%{field: value})
      {:ok, %GeneratedInput{}}

      iex> create_generated_input(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_generated_input(attrs \\ %{}) do
    %GeneratedInput{}
    |> GeneratedInput.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a generated_input.

  ## Examples

      iex> update_generated_input(generated_input, %{field: new_value})
      {:ok, %GeneratedInput{}}

      iex> update_generated_input(generated_input, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_generated_input(%GeneratedInput{} = generated_input, attrs) do
    generated_input
    |> GeneratedInput.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a generated_input.

  ## Examples

      iex> delete_generated_input(generated_input)
      {:ok, %GeneratedInput{}}

      iex> delete_generated_input(generated_input)
      {:error, %Ecto.Changeset{}}

  """
  def delete_generated_input(%GeneratedInput{} = generated_input) do
    Repo.delete(generated_input)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking generated_input changes.

  ## Examples

      iex> change_generated_input(generated_input)
      %Ecto.Changeset{data: %GeneratedInput{}}

  """
  def change_generated_input(%GeneratedInput{} = generated_input, attrs \\ %{}) do
    GeneratedInput.changeset(generated_input, attrs)
  end
end
