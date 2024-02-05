defmodule SchematicWeb.DatabaseLive.DbTable do
  use Phoenix.Component
  use PetalComponents

  @grid_tyle_length 3.5
  # @table_width 6
  @unit "em"

  def db_table(assigns) do
    ~H"""
    <.table draggable="true" style={@style}>
      <.tr style="height:3.5em;">
        <.th>
          <div class="flex justify-between">
            <span><%= @table.name %></span>
            <span class="rounded hover:cursor-pointer hover:bg-slate-600 hover:text-blue-500">
              <.icon
                name={:adjustments_horizontal}
                class="h-6 text-gray-700 dark:text-gray-300 hover:text-blue-500"
              />
            </span>
          </div>
        </.th>
      </.tr>
      <%= for column <- @table.columns do %>
        <%!-- <%= for column <- @table.table_columns do %> --%>
        <.tr
          style="height:3.5em;"
          class="hover:bg-slate-600 hover:cursor-pointer"
          phx-click="show_config_panel"
          phx-value-dbid={@db_id}
          phx-value-cid={column.id}
        >
          <.td>
            <div class="flex justify-between">
              <span><%= column.column_name %></span>
              <span>TYPE</span>
            </div>
          </.td>
        </.tr>
      <% end %>
    </.table>
    """
  end

  def convert_width_enum("wide"), do: 7
  def convert_width_enum("normal"), do: 5
  def convert_width_enum(_), do: 5

  def get_table_width(table) do
    table_width = convert_width_enum(table.grid_width)
    Map.put(table, :grid_width, table_width)
  end

  # starting column is inclusive to width
  def get_column_end(table) do
    grid_column_end = table.grid_column_start + table.grid_width - 1
    Map.put(table, :grid_column_end, grid_column_end)
  end

  # first row is table name, followed by a row for each column
  def get_row_end(table) do
    grid_row_end = table.grid_row_start + length(table.columns)
    Map.put(table, :grid_row_end, grid_row_end)
  end

  def get_table_buffer(table) do
    # TODO: should this be 2 spaces or just one?
    table
    |> Map.put(:top_buffer, table.grid_row_start - 2)
    |> Map.put(:bottom_buffer, table.grid_row_end + 2)
    |> Map.put(:left_buffer, table.grid_column_start - 2)
    |> Map.put(:right_buffer, table.grid_column_end + 2)
  end

  def format_table_style(table) do
    style = "
    width: #{@grid_tyle_length * table.grid_width}#{@unit};
    grid-column-start: #{table.grid_column_start};
    grid-column-end: #{table.grid_column_end};
    grid-row-start: #{table.grid_row_start};
    grid-row-end: #{table.grid_row_end};
    background: violet;
    z-index: 10;
    "

    Map.put(table, :style, style)
  end

  # TODO: optimize to avoid rerender for every table update
  def format_column_order(table) do
    columns =
      (table.table_columns ++ table.enum_columns ++ table.generated_columns)
      |> Enum.sort(&(&1.table_position <= &2.table_position))

    Map.put(table, :columns, columns)
  end

  def format_table(table) do
    table
    |> format_column_order
    |> get_table_width
    |> get_column_end
    |> get_row_end
    |> get_table_buffer
    |> format_table_style
  end
end
