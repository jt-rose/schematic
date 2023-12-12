defmodule SchematicWeb.DatabaseLive.PathFinder.IdealPath do
  @moduledoc """
  Maps a connector line that emphasizes a balanced aesthetic.
  Can fall back to a BFS-derived line (which may have more jagged edges
  or uneven angle placement) if this ideal path os blocked.

  A third approach, that selects next steps checked on multiple possible routes,
  balancing aesthetic and efficient distance, may be developed,
  but for now these two will suffice.

  Example: vertical angle is evenly placed between tables and limits unnecessary angles

  000
  000---|
  000   |
        |  000
        ---000
           000
  """

  # map straight line when points share column
  def get_ideal_path({col, start_row}, {col, end_row}) do
    for r <- start_row..end_row, do: {col, r}
  end

  # map straight line when points share row
  def get_ideal_path({start_col, row}, {end_col, row}) do
    for c <- start_col..end_col, do: {c, row}
  end

  def get_ideal_path({start_col, start_row}, {end_col, end_row}) do
    col_midpoint = get_midpoint(start_col, end_col)

    first_half_horizontal = for c <- start_col..col_midpoint, do: {c, start_row}
    second_half_horizontal = for c <- col_midpoint..end_col, do: {c, end_row}
    middle_vertical = get_connecting_row(start_row, end_row, col_midpoint)

    first_half_horizontal ++ middle_vertical ++ second_half_horizontal
  end

  def get_midpoint(pos, pos), do: nil

  def get_midpoint(start_pos, end_pos) do
    [lower, upper] = Enum.sort([start_pos, end_pos])
    floor((upper - lower) / 2) + lower
  end

  def get_connecting_row(start_row, end_row, col_midpoint) do
    [lower, upper] = Enum.sort([start_row, end_row])

    for r <- (lower + 1)..(upper - 1), do: {col_midpoint, r}
  end
end
