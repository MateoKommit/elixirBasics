defmodule KV do
  @moduledoc """
  Documentation for KV.
  """

  use Application

  @doc """
  Hello World.

  ## Examples

  KV.hello()
  :world
  """

  def hello do
    :world
  end

  @spec start(any, any) :: :ignore | {:error, any} | {:ok, pid}
  def start(_type, _args) do
    # Although we don't use the supervisor name below directly,
    # it can be useful when debugging or introspecting the system.
    KV.Supervisor.start_link(name: KV.Supervisor)
  end
end
