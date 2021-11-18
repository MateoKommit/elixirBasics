defmodule KVTest do
  @moduledoc """
  KV test module
  """
  use ExUnit.Case
  doctest(KV)

  test "greets the world" do
    assert KV.hello() == :world
  end
end
