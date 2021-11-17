for n <- [1, 2, 3, 4] do
  IO.puts(n * n)
end

for n <- 1..4 do
  IO.puts(n * n)
end

values = [good: 1, good: 2, bad: 3, good: 4]
for {:good, n} <- values do
  IO.puts(n * n)
end

for n <- 0..5, rem(n, 3) == 0 do
  IO.puts(n * n)
end

list = for i <- [:a, :b, :c], j <- [1, 2] do
  {i, j}
end

pixels = <<213, 45, 132, 64, 76, 32, 76, 0, 0, 234, 32, 15>>
rgb = for <<r::8, g::8, b::8 <- pixels>>, do: {r, g, b}

for <<c <- " hello world ">>, c != ?\s, into: "",  do: <<c>>
