defmodule DSLTest do
  use ExUnit.Case
  doctest DSL

  test "greets the world" do
    assert DSL.hello() == :world
  end
end
