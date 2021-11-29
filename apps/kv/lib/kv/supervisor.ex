defmodule KV.Supervisor do
  @moduledoc """
  Supervisor module to keep alive the app, and
  supports on execution failures
  """
  use Supervisor

  @spec start_link([{:name, atom | {:global, any} | {:via, atom, any}}]) ::
          :ignore | {:error, any} | {:ok, pid}
  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  @impl true
  def init(:ok) do
    children = [
      {KV.Registry, name: KV.Registry},
      {DynamicSupervisor, name: KV.BucketSupervisor, strategy: :one_for_one}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
