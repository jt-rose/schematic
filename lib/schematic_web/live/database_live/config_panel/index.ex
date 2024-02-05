defmodule SchematicWeb.DatabaseLive.ConfigPanel.Index do
  use Phoenix.Component
  use PetalComponents

  def config_panel(assigns) do
    ~H"""
    <.slide_over origin="right" title="SlideOver" max_width="sm">
      <p>lorem ipsum demo demo demo</p>
      <.h1><%= @column.column_name %></.h1>
    </.slide_over>
    """
  end

  # def handle_event("show_config_panel", %{"dbid" => db_id, "cid" => column_id}, socket) do
  #   {:noreply, push_patch(socket, to: ~p"/database/#{db_id}/column/#{column_id}")}
  # end

  # def handle_event("close_slide_over", _params, socket) do
  #   {:noreply, push_patch(socket, to: ~p"/database/#{socket.assigns.db_id}")}
  # end
end
