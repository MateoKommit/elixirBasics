# defmodule Utility do
#   @moduledoc """
#   Mechanism to achieve polimorfism in a functional
#   programming language
#   """
#   def type(value) when is_binary(value) do
#     "string"
#   end

#   def type(value) when is_integer(value) do
#     "integer"
#   end
# end

# IO.puts(Utility.type("foo"))
# IO.puts(Utility.type(4))

defprotocol Utility do
  @fallback_to_any true
  @spec type(t) :: String.t()
  def type(value)
end

defimpl Utility, for: BitString do
  def type(_value), do: "string"
end

defimpl Utility, for: Integer do
  def type(_value), do: "integer"
end

defimpl Utility, for: Any do
  def type(_value), do: "Other"
end

IO.puts(Utility.type("foo"))
IO.puts(Utility.type(4))
IO.puts(Utility.type({}))
