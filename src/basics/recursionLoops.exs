defmodule Recursion do
  @moduledoc """
  Iteration through recursion
  """
  def print_multiple_times(msg, n) when n > 0 do
    IO.puts(msg)
    print_multiple_times(msg, n - 1)
  end

  def print_multiple_times(_msg, 0) do
    :ok
  end
end

Recursion.print_multiple_times("Hello world!", 5)

defmodule Math do
  @moduledoc """
  Math module
  """
  def sum_list([head | tail], accumulator) do
    sum_list(tail, head + accumulator)
  end

  def sum_list([], accumulator) do
    accumulator
  end

  def double_each([head | tail]) do
    [head * 2 | double_each(tail)]
  end

  def double_each([]) do
    []
  end
end

IO.puts(Math.sum_list([1, 2, 3, 4], 0))

list_a = [1, 2, 3, 4]
list_b = Math.double_each(list_a)
for n <- list_a, do: IO.puts(n)
for n <- list_b, do: IO.puts(n)
