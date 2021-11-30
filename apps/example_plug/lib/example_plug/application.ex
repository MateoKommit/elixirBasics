defmodule ExamplePlug.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  @impl true
  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: ExamplePlug.Router, options: [port: cowboy_port()]}
      # Starts a worker by calling: ExamplePlug.Worker.start_link(arg)
      # {ExamplePlug.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ExamplePlug.Supervisor]
    Logger.info("Starting application...")
    Supervisor.start_link(children, opts)
  end

  defp cowboy_port do
    Application.get_env(:example_plug, :cowboy_port, 8080)
  end
end
