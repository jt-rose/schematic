defmodule Schematic.TableColumns.Config.Interval do
  use Ecto.Schema
  import Ecto.Changeset

  @data_types [
    "INTERVAL"
  ]

  @units [
    # Store only the number of years
    "YEAR",
    # Store only the number of months
    "MONTH",
    # Store only the number of days
    "DAY",
    # Store only the number of hours
    "HOUR",
    # Store only the number of minutes
    "MINUTE",
    # Store only the number of seconds
    "SECOND",
    # Store only the number of years and months
    "YEAR TO MONTH",
    # Store only the number of days and hours
    "DAY TO HOUR",
    # Store only the number of days, hours, and minutes
    "DAY TO MINUTE",
    # Store only the number of days, hours, minutes, and seconds
    "DAY TO SECOND",
    # Store only the number of hours and minutes
    "HOUR TO MINUTE",
    # Store only the number of hours, minutes, and seconds
    "HOUR TO SECOND",
    # Store only the number of minutes and seconds
    "MINUTE TO SECOND"
  ]

  @primary_key false

  embedded_schema do
    field :data_type, :string
    # only used with units that include seconds
    field :precision, :integer
    field :units, :string
  end

  def changeset(options, attrs \\ %{}) do
    options
    |> cast(attrs, [:data_type, :precision, :units])
    |> validate_required([:data_type])
    |> validate_inclusion(:data_type, @data_types)
    |> validate_inclusion(:units, @units)
    |> validate_number(:precision, greater_than: -1, less_than: 7)
  end
end
