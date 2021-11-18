# Basic ops

arr_a = [1, 2, 3, 4]
arr_b = [5, 6, 7, 8]
arr_c = arr_a ++ arr_b
arr_d = arr_c -- [8]

for n <- arr_a, do: IO.puts(n)
IO.puts("\n")
for n <- arr_b, do: IO.puts(n)
IO.puts("\n")
for n <- arr_c, do: IO.puts(n)
IO.puts("\n")
for n <- arr_d, do: IO.puts(n)
IO.puts("\n")

string_a = "foo"
string_b = "bar"
string_c = string_a <> string_b

IO.puts(string_a)
IO.puts(string_b)
IO.puts(string_c)

IO.puts(true and not false) # Just supports booleans
IO.puts(true && !false) # Supports any types as long as are comparable
IO.puts(true or false) # Just supports booleans
IO.puts(true || false) # Supports any types as long as are comparable
IO.puts(not true or false) # Just supports booleans
IO.puts(!true || false) # Supports any types as long as are comparable

# Short-circuit
false and raise("This error will never be raised")
true or raise("This error will never be raised")

# or
IO.puts(1 || true)
IO.puts(false || 11)

# and
IO.puts(nil && 13)
IO.puts(true && 17)

# not
IO.puts(!true)
IO.puts(!1)
IO.puts(!nil)

# greater (and equals) than and lesser (and equals) than
IO.puts(1 == 1)
IO.puts(1 != 2)
IO.puts(1 < 2)

# types comparision
IO.puts(1 == 1.0)
IO.puts(1 === 1.0)

# datatypes comparision
IO.puts(1 < :atom)

# data types value
# number < atom < reference < function < port < pid < tuple < map < list < bitstring
