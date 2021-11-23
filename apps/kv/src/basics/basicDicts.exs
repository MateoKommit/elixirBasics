list_a = [{:a, 1}, {:b, 2}]
list_b = [a: 1, b: 2]
list_c = list_a ++ [c: 3]

IO.puts("")
for i <- list_b, do: for j <- 0..tuple_size(i) - 1, do: IO.puts(elem(i, j))
IO.puts("")
for i <- list_a, do: for j <- 0..tuple_size(i) - 1, do: IO.puts(elem(i, j))
IO.puts("")
for i <- list_c, do: for j <- 0..tuple_size(i) - 1, do: IO.puts(elem(i, j))

IO.puts("")
map = %{:a => 1, 2 => :b}
for i <- map, do: for j <- 0..tuple_size(i) - 1, do: IO.puts(elem(i, j))

IO.puts("")
IO.puts(Map.get(map, :a))
map = Map.put(map, :c, 3)
IO.puts("")
for i <- map, do: for j <- 0..tuple_size(i) - 1, do: IO.puts(elem(i, j))
