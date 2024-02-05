defmodule SchematicWeb.DatabaseLive.PathFinder.Bookends do
  def get_leftside_pos(table, id) do
    column = table.grid_column_start - 1
    row = table.grid_row_start + Enum.find_index(table.columns, fn c -> c.id == id end) + 1

    # TODO: nil handling?
    {column, row}
  end

  def get_rightside_pos(table, id) do
    # TODO: add variable width
    column = table.grid_column_start + 5
    row = table.grid_row_start + Enum.find_index(table.columns, fn c -> c.id == id end) + 1

    # TODO: nil handling?
    {column, row}
  end

  def find_table_with_key_column(db, key_column_id) do
    Enum.find(db.database_tables, fn table ->
      Enum.any?(table.columns, fn col -> col.id == key_column_id end)
    end)
  end

  # TODO: fk-right col
  def get_bookends({c1, _r1} = fk_right_col, {c2, _r2} = pk_right_col) do
    col_spread = for c <- c1..c2, do: c

    [lower, higher] = Enum.sort_by([fk_right_col, pk_right_col], fn {c, _r} -> c end)
    # todo: update for varying column width of table
    case length(col_spread) >= 5 do
      true -> [%{pos: lower, from: :left}, get_table_left_edge(higher)]
      false -> [%{pos: lower, from: :left}, %{pos: higher, from: :left}]
    end
  end

  # todo: update for varying column width of table
  def get_table_left_edge({c, r}) do
    %{pos: {c - 6, r}, from: :right}
  end
end
