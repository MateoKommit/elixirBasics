# defmodule Math do
#   @moduledoc """
#   Math module
#   """
#   def sum(a, b) do
#     a + b
#   end
# end


defmodule Math do
  @moduledoc """
  Here goes the explanation of the module
  """
  def sum(a, b) do
    do_sum(a, b)
  end

  defp do_sum do
    a + b
  end
end

Math.sum(1, 2)

defmodule Concat do
  @moduledoc """
  Module description
  """
  def join(a, b, sep \\ " ") do
    a <> sep <> b
  end
end
