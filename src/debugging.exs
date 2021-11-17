# a = {1, 2, 3}
# IO.inspect(a)

defmodule ModuleA do
  @moduledoc """
  This module is used to test the debugger funtionalities of elixir
  """
  def some_fun(a, b, c) do
    require IEx; IEx.pry
    IO.puts("I am inside the some_fun function #{a + b + c}")
  end
end

Module_a.some_fun(1, 2, 3)
