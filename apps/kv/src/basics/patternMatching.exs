# = is called the match operator
x = 1 # Here I'm assigning 1 to x
IO.puts(1 = x) # Here I'm asking if 1 matches x which is true
# IO.puts(2 = x) # Here I'm asking if 2 matches x which is false
# 1 = unknown
{a, b , c} = {:hello, "world", 42}
IO.puts(a) # :hello
IO.puts(b) # "world"
IO.puts(c) # 42

{:ok, result} = {:ok, 13} # Assigning 13 to result
IO.puts(result) # 13
[d, e, f] = [1, 2, 3]
IO.puts(d) # 1
IO.puts(e) # 2
IO.puts(f) # 3

[head | tail] = [1, 2, 3]
IO.puts(head)
for n <- tail, do: IO.puts(n)

list = [1, 2, 3]
[0 | list] # [0, 1, 2, 3]
for n <- tail, do: IO.puts(n)

x = 1
IO.puts(x)
x = 2 # Assignment
IO.puts(x)

# Pin operator
# As i understand is similar to ===, if matches return the value
# if not raises an error
IO.puts(^x = 2)

# Due to algebraic behavior in elixir we can do things like this
1 = 2 # return an error because there is no matching
# or
1 = 1 # return the value of the match (1 in this case)

y = 1
IO.puts([^y, 2, 3] = [1, 2, 3]) # [1, 2, 3]

{z, ^x} = {2, 1} # {2,1}
IO.puts(z) # 2
