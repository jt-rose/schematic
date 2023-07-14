defmodule Schematic.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SchematicWeb.Telemetry,
      # Start the Ecto repository
      Schematic.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Schematic.PubSub},
      # Start Finch
      {Finch, name: Schematic.Finch},
      # Start the Endpoint (http/https)
      SchematicWeb.Endpoint
      # Start a worker by calling: Schematic.Worker.start_link(arg)
      # {Schematic.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Schematic.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SchematicWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
