defmodule KV.Registry do
  @moduledoc """
  Registry module of the KV app
  """
  use GenServer

  @spec start_link([
          {:debug, [:log | :statistics | :trace | {any, any}]}
          | {:hibernate_after, :infinity | non_neg_integer}
          | {:name, atom | {:global, any} | {:via, atom, any}}
          | {:spawn_opt, [:link | :monitor | {any, any}]}
          | {:timeout, :infinity | non_neg_integer}
        ]) :: :ignore | {:error, any} | {:ok, pid}
  @doc """
  Starts the registry.
  """
  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  @spec lookup(atom | pid | {atom, any} | {:via, atom, any}, any) :: any
  @doc """
  Looks up the bucket pid for `name` stored in `server`.

  Returns `{:ok, pid}` if the bucket exists, `:error` otherwise.
  """
  def lookup(server, name) do
    GenServer.call(server, {:lookup, name})
  end

  @spec create(atom | pid | {atom, any} | {:via, atom, any}, any) :: :ok
  @doc """
  Ensures there is a bucket associated with the given `name` in `server`.
  """
  def create(server, name) do
    GenServer.cast(server, {:create, name})
  end

  ## Defininf Genserver Callbacks

  @impl true
  @spec init(:ok) :: {:ok, %{}}
  def init(:ok) do
    {:ok, %{}}
  end

  @impl true
  def handle_call({:lookup, name}, _from, names) do
    {:reply, Map.fetch(names, name), names}
  end

  @impl true
  def handle_cast({:create, name}, names) do
    if Map.has_key?(names, name) do
      {:noreply, names}
    else
      {:ok, bucket} = KV.Bucket.start_link([])
      {:noreply, Map.put(names, name, bucket)}
    end
  end
end
