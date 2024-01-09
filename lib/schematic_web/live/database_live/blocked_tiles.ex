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

  def get_all_blocked_tiles(tables), do: Enum.flat_map(tables, &get_blocked_tiles/1)

  def is_blocked_tile?(pos, blocked_tiles), do: pos in blocked_tiles
end
