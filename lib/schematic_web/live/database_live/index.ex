defmodule SchematicWeb.DatabaseLive.Index do
  use SchematicWeb, :live_view

  # alias Schematic.Projects
  # alias Schematic.Projects.ProjectDatabase
  alias Schematic.Queries
  import SchematicWeb.DatabaseLive.Connector
  import SchematicWeb.DatabaseLive.GridLayout
  import SchematicWeb.DatabaseLive.DbTable

  @grid_tyle_length 3.5
  @table_width 6
  @unit "em"

  def render(assigns) do
    ~H"""
    <%= for db <- @dbs do %>
      <h1><%= db.name %></h1>
      <.vertical_line col={1} row={1} />
      <.grid_layout style={format_grid_style(40, 40)}>
        <%= for tb <- db.database_tables do %>
          <.db_table table={tb} db_id={@db_id} style={format_table_style(tb)} />
        <% end %>
        <%!-- <.vertical_line /> --%>
        <.horizontal_line col={7} row={3} />
        <.bottomleft_angle col={8} row={3} />
        <.vertical_line col={8} row={4} />
        <.vertical_line col={8} row={5} />
        <.vertical_line col={8} row={6} />
        <.vertical_line col={8} row={7} />
        <.vertical_line col={8} row={8} />
        <.topright_angle col={8} row={9} />
        <%!--  --%>
        <.topleft_angle col={10} row={10} />
        <.topright_angle col={11} row={10} />
        <.bottomleft_angle col={10} row={11} />
        <.bottomright_angle col={11} row={11} />
      </.grid_layout>
    <% end %>
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
    dbs = Queries.list_db_tables(id)
    IO.inspect(dbs)
    socket = assign(socket, db_id: id, dbs: dbs, selected_column: nil)
    {:ok, socket}
  end

  def handle_params(params, _uri, socket) do
    case socket.assigns.live_action do
      :index ->
        {:noreply, assign(socket, selected_column: nil)}

      :config_panel ->
        # TODO: refactor / optimize
        {cid, _} = Integer.parse(params["cid"])

        column =
          socket.assigns.dbs
          |> Enum.flat_map(fn db -> db.database_tables end)
          |> Enum.flat_map(fn table -> table.table_columns end)
          |> Enum.find(fn col -> col.id == cid end)

        socket = assign(socket, selected_column: column)
        {:noreply, socket}
    end
  end

  def handle_event("show_config_panel", %{"dbid" => db_id, "cid" => column_id}, socket) do
    {:noreply, push_patch(socket, to: ~p"/database/#{db_id}/column/#{column_id}")}
  end

  def handle_event("close_slide_over", _params, socket) do
    {:noreply, push_patch(socket, to: ~p"/database/#{socket.assigns.db_id}")}
  end

  # TODO: add bad route fallback
end
