# map = %{a: 1, b: 2}
# map[:a]
# %{map | a: 3}

defmodule User do
  @moduledoc """
  User module to the elixir guide
  """
  @enforce_keys [:name]
  defstruct name: "John", age: 22
end

defmodule Main do
  @moduledoc """
  Module main so can use User structs
  """
  def main do
    john = %User{name: "Mateo"}
    IO.puts(john.name)
    IO.puts(john.age)
  end
end

Main.main()
