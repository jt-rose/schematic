defmodule SchematicWeb.DatabaseLive.BlockedTiles do
  def get_blocked_tiles(table) do
    # map out 3.2, 3.3, 3.4, 4.2, 4.3, 4.4, etc. as blocked
    %{
      grid_column_start: grid_column_start,
      grid_column_end: grid_column_end,
      grid_row_start: grid_row_start,
      grid_row_end: grid_row_end
    } = table

    columns = for x <- grid_column_start..grid_column_end, do: x
    rows = for x <- grid_row_start..grid_row_end, do: x

    blocked_tiles = for c <- columns, r <- rows, do: {c, r}

    blocked_tiles
  end

  # def get_blocked_tiles_with_gutters(table) do
  #   # map out 3.2, 3.3, 3.4, 4.2, 4.3, 4.4, etc. as blocked
  #   %{
  #     grid_column_start: grid_column_start,
  #     grid_column_end: grid_column_end,
  #     grid_row_start: grid_row_start,
  #     grid_row_end: grid_row_end
  #   } = table

  #   columns = for x <- (grid_column_start - 1)..(grid_column_end + 1), do: x
  #   rows = for x <- (grid_row_start - 1)..(grid_row_end + 1), do: x

  #   blocked_tiles = for c <- columns, r <- rows, do: {c, r}

  #   blocked_tiles
  # end

  def get_table_gutters(table) do
    %{
      grid_column_start: grid_column_start,
      grid_column_end: grid_column_end,
      grid_row_start: grid_row_start,
      grid_row_end: grid_row_end
    } = table

    top_gutter =
      for c <- (grid_column_start - 1)..(grid_column_end + 1), do: {c, grid_row_start - 1}

    bottom_gutter =
      for c <- (grid_column_start - 1)..(grid_column_end + 1), do: {c, grid_row_end + 1}

    right_gutter = for r <- grid_row_start..grid_row_end, do: {grid_column_start - 1, r}
    left_gutter = for r <- grid_row_start..grid_row_end, do: {grid_column_end + 1, r}

    # %{
    #   top_gutter: top_gutter,
    #   bottom_gutter: bottom_gutter,
    #   right_gutter: right_gutter,
    #   left_gutter: left_gutter
    # }

    top_gutter ++ right_gutter ++ bottom_gutter ++ left_gutter
  end

  def get_all_blocked_tiles(tables), do: Enum.flat_map(tables, &get_blocked_tiles/1)

  def get_all_table_gutters(tables), do: Enum.flat_map(tables, &get_table_gutters/1)

  def is_blocked_tile?(pos, blocked_tiles), do: pos in blocked_tiles
end
