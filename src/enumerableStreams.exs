list_a = Enum.map([1, 2, 3], fn x -> x * 2 end)
for n <- list_a do
  IO.puts(n)
end

list_b = Enum.map(%{1 => 2, 3 => 4}, fn {k, v} -> k * v end)
for n <- list_b do
  IO.puts(n)
end

list_c = Enum.map(1..5, fn x -> x*2 end)
for n <- list_c do
  IO.puts(n)
end

odd? = &(rem(&1, 2) != 0)
IO.puts(1..100_000 |> Enum.map(&(&1 * 3)) |> Enum.filter(odd?) |> Enum.sum())
