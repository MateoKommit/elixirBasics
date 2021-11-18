defmodule MyServer do
  @moduledoc """
  Module expample of the module secction in elixir
  path
  """
  @initial_state %{host: "localhost", port: 3456}
  keys = Map.keys(@initial_state)
  for n <- keys do
    IO.puts(@initial_state[n])
  end
end
