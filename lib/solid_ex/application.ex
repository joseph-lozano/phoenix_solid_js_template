defmodule SolidEx.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl Application
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SolidExWeb.Telemetry,
      # Start the Ecto repository
      SolidEx.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: SolidEx.PubSub},
      # Start Finch
      {Finch, name: SolidEx.Finch},
      # Start the Endpoint (http/https)
      SolidExWeb.Endpoint
      # Start a worker by calling: SolidEx.Worker.start_link(arg)
      # {SolidEx.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SolidEx.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl Application
  def config_change(changed, _new, removed) do
    SolidExWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
