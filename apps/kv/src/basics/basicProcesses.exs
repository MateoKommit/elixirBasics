pid = spawn(fn -> 1 + 2 end)
IO.puts(Process.alive?(pid))

self_pid = self()
IO.puts(Process.alive?(self_pid))

send(self(), {:hello, "world"})
receive do
  {:hello, msg} -> IO.puts(msg)
  {:world, _msg} -> IO.puts("won't match")
end

receive do
  {:hello, msg} -> msg
  after
    1_000 -> IO.puts("nothing after 1s")
end

parent = self()
spawn(fn -> send(parent, {:hello, self()}) end)
receive do
  {:hello, pid} -> IO.puts("Got hello from #{inspect pid}")
end
