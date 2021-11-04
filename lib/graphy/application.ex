defmodule Graphy.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Graphy.Repo,
      # Start the Telemetry supervisor
      GraphyWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Graphy.PubSub},
      # Start the Endpoint (http/https)
      GraphyWeb.Endpoint
      # Start a worker by calling: Graphy.Worker.start_link(arg)
      # {Graphy.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Graphy.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GraphyWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
