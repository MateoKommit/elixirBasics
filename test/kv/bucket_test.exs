defmodule KV.BucketTest do
  @moduledoc """
  KV bucket test module
  """
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = KV.Bucket.start_link([])
    %{bucket: bucket}
  end

  test "stores values by key", %{bucket: bucket} do
    assert KV.Bucket.get(bucket, "milk") == nil

    KV.Bucket.put(bucket, "milk", 3)
    assert KV.Bucket.get(bucket, "milk") == 3
  end

  @doc """
  Deletes `key` from `bucket`

  Returns the currect value of `key`, if `key` exists.
  """
  def delete(bucket, key) do
    Process.sleep(1_000)
    Agent.get_and_update(bucket, fn dict ->
      Process.sleep(1_000)
      Map.pop(dict, key)
    end)
  end

  def put(bucket, key, value) do
    GenServer.call(bucket, {:put, key, value})
  end

  def handle_call({:put, key, value}, _from, state) do
    {:reply, :ok, Map.put(state, key, value)}
  end

end
