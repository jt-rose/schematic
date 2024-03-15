defmodule SchematicWeb.DatabaseLive.Index do
  use SchematicWeb, :live_view

  # alias Schematic.Projects
  # alias Schematic.Projects.ProjectDatabase
  alias Schematic.Queries
  import SchematicWeb.DatabaseLive.Connector
  import SchematicWeb.DatabaseLive.Pathfinder
  import SchematicWeb.DatabaseLive.GridLayout
  import SchematicWeb.DatabaseLive.DbTable
  import SchematicWeb.DatabaseLive.BlockedTiles

  @grid_tyle_length 3.5
  # @table_width 6
  @unit "em"

  def render(assigns) do
    ~H"""
    <h1><%= @db_name %></h1>
    <button phx-click="bump-up">UP</button>
    <button phx-click="bump-down">DOWN</button>
    <button phx-click="adjust">adjust</button>
    <.grid_layout style={@grid_style} blocked_tiles={@blocked_tiles} borders={@grid_borders}>
      <%= for tb <- @tables do %>
        <.db_table table={tb} db_id={@db_id} style={tb.style} buffer_style={tb.buffer_style} />
      <% end %>
      <%= for connector_set <- @connectors do %>
        <%= for connector <- connector_set do %>
          <.connector orientation={connector.edges} pos={connector.pos} />
        <% end %>
      <% end %>
    </.grid_layout>

    <%= if @selected_column do %>
      <.config_panel column={@selected_column} />
    <% end %>
    """
  end

  def config_panel(assigns) do
    ~H"""
    <.slide_over origin="right" title="SlideOver" max_width="sm">
      <p>lorem ipsum demo demo demo</p>
      <.h1><%= @column.column_name %></.h1>
    </.slide_over>
    """
  end

  def mount(%{"id" => id} = _params, _session, socket) do
    socket = format_db_data_for_grid(id, socket)
    for bt <- socket.assigns.blocked_tiles, do: IO.inspect(bt)
    {:ok, socket}
  end

  def format_db_data_for_grid(db_id, socket) do
    db = Queries.list_db_tables(db_id) |> Enum.at(0)

    # format tables and db
    tables = db.database_tables |> Enum.map(&format_table/1)
    fmt_db = %{db | database_tables: tables}

    # determine unavailable tiles
    blocked_tiles = get_all_blocked_tiles(tables)
    grid_borders = calculate_grid_borders(tables)
    blocked_border_tiles = calculate_boundary_blocked_tiles(grid_borders)
    # grid_borders
    borders_and_blocked_tiles = blocked_tiles ++ blocked_border_tiles

    blocked_table_gutters = get_all_table_gutters(tables)

    # generate connecting lines for table relationships
    connectors = generate_connectors(fmt_db, borders_and_blocked_tiles)
    # format grid styling
    grid_width = grid_borders.right_buffer - grid_borders.left_buffer
    grid_height = grid_borders.bottom_buffer - grid_borders.top_buffer
    grid_style = format_grid_style(grid_width, grid_height)

    socket =
      assign(socket,
        db_id: db_id,
        db_name: db.name,
        tables: tables,
        blocked_tiles: blocked_tiles ++ blocked_table_gutters,
        grid_borders: grid_borders,
        relationships: db.table_relationships,
        grid_style: grid_style,
        connectors: connectors,
        selected_column: nil
      )

    socket
  end

  def handle_params(params, _uri, socket) do
    case socket.assigns.live_action do
      :index ->
        {:noreply, assign(socket, selected_column: nil)}

      :config_panel ->
        # TODO: refactor / optimize
        {cid, _} = Integer.parse(params["cid"])

        column =
          socket.assigns.tables
          |> Enum.flat_map(fn table -> table.table_columns end)
          |> Enum.find(fn col -> col.id == cid end)

        socket = assign(socket, selected_column: column)
        {:noreply, socket}
    end
  end

  def handle_event("bump-up", _, socket) do
    IO.puts("BUMP UP")

    Schematic.DatabaseTables.bump(1)

    updated_socket = format_db_data_for_grid(1, socket)
    {:noreply, updated_socket}
  end

  def handle_event("bump-down", _, socket) do
    IO.puts("BUMP DOWN")
    Schematic.DatabaseTables.bump(-1)
    updated_socket = format_db_data_for_grid(1, socket)
    {:noreply, updated_socket}
  end

  def handle_event("adjust", _, socket) do
    IO.puts("ADJUST")
    Schematic.DatabaseTables.repos_and_bump(1, {2, 7})
    updated_socket = format_db_data_for_grid(1, socket)
    {:noreply, updated_socket}
  end

  def handle_event("show_config_panel", %{"dbid" => db_id, "cid" => column_id}, socket) do
    {:noreply, push_patch(socket, to: ~p"/database/#{db_id}/column/#{column_id}")}
  end

  def handle_event("close_slide_over", _params, socket) do
    {:noreply, push_patch(socket, to: ~p"/database/#{socket.assigns.db_id}")}
  end

  def handle_event("update_position", %{"pos" => [c, r], "table_id" => table_id}, socket) do
    # %{table_id: id, pos: [col, row]}
    IO.puts("HELLO FROM CLIENT")
    IO.inspect(c)
    IO.inspect(r)
    IO.inspect(table_id)
    dbt = Schematic.DatabaseTables.get_database_table!(table_id)

    # TODO - confirm not in blocked tiles

    # DatabaseTables.update_database_table(dbt, %{grid_column_start: 3, grid_row_start: 3})
    Schematic.DatabaseTables.update_database_table(dbt, %{grid_column_start: c, grid_row_start: r})

    updated_socket = format_db_data_for_grid(1, socket)
    {:noreply, updated_socket}
  end

  # TODO: add bad route fallback
end
