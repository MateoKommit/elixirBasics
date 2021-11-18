case {1, 2, 3} do
  {4, 5, 6} ->
    "this clause won't match"
  {1, x, 3} ->
    IO.puts("This cause will match and bind x to 2 in this clause, x:#{x}")
  _ ->
    IO.puts("This clause would match any value")
end
# Return: This cause will match and bind x to 2 in this clause

x = 1
case 10 do
  ^x -> IO.puts("Won't match")
  _ -> IO.puts("Will match")
end
# Return will match

# guards for special conditions
case {1, 2, 3} do
  {1, 2, 3} when x > 0 -> IO.puts("Will match")
  _ -> IO.puts("Would match if guard condition was no stablished")
end

# hd(1) # Throws an error

# case 1 do
#   x when hd(x) -> IO.puts("Won't match")
#   x -> IO.puts("Got #{x}")
# end
# Return got 1

case :ok do
  :error -> IO.puts("Won't match")
  _ -> IO.puts("If wasn't becau se of this clause it'll trhows an error")
end

f = fn
  x, y when x > 0 -> x + y
  x, y -> x * y
end

IO.puts(f.(1, 3)) # 1 + 3 = 4
IO.puts(f.(-1, 3)) # -1 * 3 = -3

# forbbiden due to arity inconsistency
# f2 = fn
#   x, y when x > 0 -> x + y
#   x, y, z -> x * y + z
# end

cond do
  2 + 2 == 5 ->
    IO.puts("This will not be true")
  2 * 2 == 3 ->
    IO.puts("Nor this")
  1 + 1 == 2 ->
    IO.puts("But this will")
end

if true do
  IO.puts("This one works")
end

unless true do
  IO.puts("This will never be seen")
end

x = 1
if true do
  x = x + 1
  IO.puts(x)
end

x = if true do
  x + 1
end
IO.puts(x)

if true, do: IO.puts("Another form to write an if")
if true, do: IO.puts(:this), else: IO.puts(:that)
