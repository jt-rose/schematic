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
      <%= for column <- @table.table_columns do %>
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

  def get_column_boundaries(table, table_width) do
    column_start = table.grid_column_start
    column_end = table.grid_column_start + table_width

    {column_start, column_end}
  end

  def get_row_boundaries(table) do
    row_start = table.grid_row_start
    row_end = table.grid_row_start + length(table.table_columns)

    {row_start, row_end}
  end

  def format_table_style(table) do
    table_width = convert_width_enum(table.grid_width)
    {column_start, column_end} = get_column_boundaries(table, table_width)
    {row_start, row_end} = get_row_boundaries(table)

    "
    width: #{@grid_tyle_length * table_width}#{@unit};
    grid-column-start: #{column_start};
    grid-column-end: #{column_end};
    grid-row-start: #{row_start};
    grid-row-end: #{row_end};
    background: violet;
    z-index: 10;"
  end
end
