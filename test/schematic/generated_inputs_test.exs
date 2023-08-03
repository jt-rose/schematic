defmodule Schematic.GeneratedInputsTest do
  use Schematic.DataCase

  alias Schematic.GeneratedInputs

  describe "generated_inputs" do
    alias Schematic.GeneratedInputs.GeneratedInput

    import Schematic.GeneratedInputsFixtures

    @invalid_attrs %{placeholder_symbol: nil}

    test "list_generated_inputs/0 returns all generated_inputs" do
      generated_input = generated_input_fixture()
      assert GeneratedInputs.list_generated_inputs() == [generated_input]
    end

    test "get_generated_input!/1 returns the generated_input with given id" do
      generated_input = generated_input_fixture()
      assert GeneratedInputs.get_generated_input!(generated_input.id) == generated_input
    end

    test "create_generated_input/1 with valid data creates a generated_input" do
      valid_attrs = %{placeholder_symbol: "some placeholder_symbol"}

      assert {:ok, %GeneratedInput{} = generated_input} = GeneratedInputs.create_generated_input(valid_attrs)
      assert generated_input.placeholder_symbol == "some placeholder_symbol"
    end

    test "create_generated_input/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GeneratedInputs.create_generated_input(@invalid_attrs)
    end

    test "update_generated_input/2 with valid data updates the generated_input" do
      generated_input = generated_input_fixture()
      update_attrs = %{placeholder_symbol: "some updated placeholder_symbol"}

      assert {:ok, %GeneratedInput{} = generated_input} = GeneratedInputs.update_generated_input(generated_input, update_attrs)
      assert generated_input.placeholder_symbol == "some updated placeholder_symbol"
    end

    test "update_generated_input/2 with invalid data returns error changeset" do
      generated_input = generated_input_fixture()
      assert {:error, %Ecto.Changeset{}} = GeneratedInputs.update_generated_input(generated_input, @invalid_attrs)
      assert generated_input == GeneratedInputs.get_generated_input!(generated_input.id)
    end

    test "delete_generated_input/1 deletes the generated_input" do
      generated_input = generated_input_fixture()
      assert {:ok, %GeneratedInput{}} = GeneratedInputs.delete_generated_input(generated_input)
      assert_raise Ecto.NoResultsError, fn -> GeneratedInputs.get_generated_input!(generated_input.id) end
    end

    test "change_generated_input/1 returns a generated_input changeset" do
      generated_input = generated_input_fixture()
      assert %Ecto.Changeset{} = GeneratedInputs.change_generated_input(generated_input)
    end
  end
end
