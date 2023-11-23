defmodule SchematicWeb.ProjectsLive.Index do
  use SchematicWeb, :live_view
  alias Schematic.Accounts
  alias Schematic.Queries

  def render(assigns) do
    ~H"""
    <h2>Tables:</h2>
    <p><%= @projects %></p>
    <br />
    <h2>User_id:</h2>
    <p><%= @uid %></p>
    """
  end

  def mount(_params, session, socket) do
    u = Accounts.get_user_by_session_token(session["user_token"])
    IO.inspect(u)

    projects =
      Queries.list_projects_with_databases(u.id)

    IO.inspect(projects)

    names = projects |> Enum.map(fn item -> item.name end) |> Enum.join(", ")
    IO.inspect(names)
    {:ok, assign(socket, projects: names, uid: u.id)}
  end
end
