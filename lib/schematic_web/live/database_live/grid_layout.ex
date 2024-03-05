defmodule SchematicWeb.DatabaseLive.GridLayout do
  use Phoenix.Component

  @grid_tyle_length 3.5
  @table_width 6
  @unit "em"

  @default_grid %{
    top_buffer: 1,
    right_buffer: 101,
    bottom_buffer: 101,
    left_buffer: 1
  }

  def grid_layout(assigns) do
    ~H"""
    <div
      id="schematic-grid-layout"
      style={@style}
      class="bg-teal-600"
      phx-hook="GridHover"
      data-blockedtiles={encode_blocked_tiles(@blocked_tiles)}
      data-topborder={@borders.top_buffer}
      data-rightborder={@borders.right_buffer}
      data-bottomborder={@borders.bottom_buffer}
      data-leftborder={@borders.left_buffer}
    >
      <div id="grid-hover-tile" class="hidden border-2 border-teal-400"></div>
      <%!-- <%= for column <- 1..@column_length do %>
        <%= for row <- 1..@row_length do %>
          <.grid_tile label={"#{column}-#{row}"} column={column} row={row} />
        <% end %>
      <% end %> --%>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  def encode_blocked_tiles(blocked_tiles) do
    blocked_tiles
    |> Enum.map(fn {col, row} -> [col, row] end)
    |> Jason.encode!()
  end

  def format_grid_style(column_length, row_length) do
    "
    width:#{column_length * @grid_tyle_length}em;
    height:#{row_length * @grid_tyle_length}em;
    display:grid;
    grid-template-columns: repeat(#{column_length}, #{@grid_tyle_length}em);
    grid-template-rows: repeat(#{row_length}, #{@grid_tyle_length}em);
    "
  end

  def get_outermost_boundary(boundary, table) do
    top = min(boundary.top_buffer, table.top_buffer)
    right = max(boundary.right_buffer, table.right_buffer)
    bottom = max(boundary.bottom_buffer, table.bottom_buffer)
    left = min(boundary.left_buffer, table.left_buffer)

    %{
      top_buffer: top,
      right_buffer: right,
      bottom_buffer: bottom,
      left_buffer: left
    }
  end

  # add buffer to table boundaries for readability
  def add_table_buffer(boundary) do
    l = max(boundary.l - 2, 0)
    r = boundary.r + 2
    t = max(boundary.t - 2, 0)
    b = boundary.t + 2

    %{l: l, r: r, t: t, b: b}
  end

  # add additional space around outermost boundaries for adding new tables / readability
  def add_grid_buffer(boundary) do
    %{
      top_buffer: boundary.top_buffer - 20,
      right_buffer: boundary.right_buffer + 20,
      bottom_buffer: boundary.bottom_buffer + 20,
      left_buffer: boundary.left_buffer - 20
    }
  end

  def calculate_boundary_blocked_tiles(
        %{
          top_buffer: top,
          right_buffer: right,
          bottom_buffer: bottom,
          left_buffer: left
        } = _boundary
      ) do
    top_border = for c <- left..right, do: {c, top}
    right_border = for r <- top..bottom, do: {right, r}
    bottom_border = for c <- left..right, do: {c, bottom}
    left_border = for r <- top..bottom, do: {left, r}

    top_border ++ right_border ++ bottom_border ++ left_border
  end

  # determine amount of grid columns and rows needed
  def calculate_grid_borders(tables) do
    tables
    |> Enum.reduce(@default_grid, fn x, acc -> get_outermost_boundary(x, acc) end)
    |> add_grid_buffer

    # |> calculate_boundary_blocked_tiles
  end
end
