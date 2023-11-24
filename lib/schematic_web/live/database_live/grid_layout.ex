defmodule SchematicWeb.DatabaseLive.GridLayout do
  use Phoenix.Component

  @grid_tyle_length 3.5
  @table_width 6
  @unit "em"

  def grid_layout(assigns) do
    ~H"""
    <div style={@style} class="bg-teal-600 ">
      <%!-- <%= for column <- 1..@column_length do %>
        <%= for row <- 1..@row_length do %>
          <.grid_tile label={"#{column}-#{row}"} column={column} row={row} />
        <% end %>
      <% end %> --%>
      <%= render_slot(@inner_block) %>
    </div>
    """
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

  # calculate amount of grid rows required to display table
  def calculate_table_height(table) do
    std_col_length = table.table_columns |> length
    enum_col_length = table.enum_columns |> length
    gen_col_length = table.generated_columns |> length

    1 + std_col_length + enum_col_length + gen_col_length
  end

  # calculate width of grid columns to display table
  def calculate_table_width(_table) do
    # TODO - update schema
    3
  end

  # calculate grid column and grid row start and stop positions
  def calculate_table_boundaries(_table) do
    # TODO - avoid using this logic twice
    %{l: 2, r: 4, t: 0, b: 5}
  end

  # compare two table boundaries and determine outermost boundaries
  def get_outermost_boundary(bounds_1, bounds_2) do
    l = min(bounds_1.l, bounds_2.l)
    r = max(bounds_1.r, bounds_2.r)
    t = min(bounds_1.t, bounds_2.t)
    b = max(bounds_1.b, bounds_2.b)

    %{l: l, r: r, t: t, b: b}
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
    # TODO: either allow negative bounds and recal for css-grid
    # TODO: or recalc boundary position to renable buffer
    l = max(boundary.l - 10, 0)
    r = boundary.r + 10
    t = max(boundary.t - 10, 0)
    b = boundary.b + 10

    %{l: l, r: r, t: t, b: b}
  end

  # determine amount of grid columns and rows needed
  def calculate_grid_borders(db) do
    db.database_tables
    |> Enum.map(&calculate_table_boundaries/1)
    |> Enum.reduce(&get_outermost_boundary/2)
    |> add_table_buffer
    |> add_grid_buffer
  end

  def get_negative_space_adjustment(_boundary) do
    # TODO - keep negative space but adjust all numbers
    # TODO - on x and y axis of grid to to conform to positive integers
    # TODO - for grid modeling
  end
end
