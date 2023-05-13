defmodule TodoPlug.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: TodoPlug.Worker.start_link(arg)
      {Todo.TodoServer, nil},
      {Plug.Cowboy, scheme: :http, plug: TodoPlug, options: [port: 4000]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TodoPlug.Supervisor]
    Logger.info "The server has started at port: 4000..."
    Supervisor.start_link(children, opts)
  end
end
