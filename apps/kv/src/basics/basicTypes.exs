IO.puts("Hello world from elixir")

# Basic types

number = 1
IO.puts(number)
number_hex = 0x1F
IO.puts(number_hex)
number_float = 1.0
IO.puts(number_float)
bool_var = true
IO.puts(bool_var)
atom = :atom
IO.puts(atom)
string = "elixir"
IO.puts(string)
list = [1, 2, 3]
for n <- list, do: IO.puts(n)
tuple = {1, 2, 3}
for n <- 0..tuple_size(tuple) - 1, do: IO.puts(elem(tuple, n))


# Basic arithmetic

addition = 1 + 2
IO.puts(addition)
substract = 4 - 2
IO.puts(substract)
multiplication = 4 * 2
IO.puts(multiplication)
division = 4 / 2
IO.puts(division)

# Alternatives

integer_division = div(4, 2) # Integer division
IO.puts(integer_division)
division_remanent = rem(4, 2) # Remainder of the divisioninteger_division
IO.puts(division_remanent)

# Numberic bases
bin = 0b1010
IO.puts(bin)
octal = 0o777 # I have no idea what is octal base actually used for
IO.puts(octal)
hex = 0x1F
IO.puts(hex)

# Scientific notation
# 10x10^10
power_ten = 1.0e10
IO.puts(power_ten)
# Floating numbers precision
rounded = round(3.69)
IO.puts(rounded)
truncate = trunc(3.69)
IO.puts(truncate)

# Type validations
bool_validation = is_boolean(true)
IO.puts(bool_validation)
non_bool_validation = is_boolean(1)
IO.puts(non_bool_validation)
# and so on

# Atoms
atm = :apple
IO.puts(atm)
# Atoms value is their name so :apple atom has in it the apple value
IO.puts(:apple == :apple) # Therefore atoms are equal if their names are equal

# Booleans are atoms :O
true_equals_atom = true == :true
IO.puts(true_equals_atom)
false_equals_atom = false == :false
IO.puts(false_equals_atom)

# It is posible to skip the : only in the true false and nill keywords

# Strings
# Are delimited by double quotes and are encoded in UTF-8
weird_string = "Hellö"
even_more_weird_string = "Мир"
# Elixir supports string interpolation
interpolated_string = "#{weird_string} \n #{even_more_weird_string}"
IO.puts(interpolated_string)

IO.puts(is_atom(Hello))
IO.puts(is_binary(weird_string))
IO.puts(byte_size(weird_string))
IO.puts(String.length(weird_string))
IO.puts(String.upcase(weird_string))

# Anonymus functions
add = fn a, b -> a + b end
IO.puts(add.(1, 2))
IO.puts(is_function(add))

double = fn a -> add.(a, a) end
IO.puts(double.(2))

# Linked lists
linked_list_a = [1, 2, true, 3]
linked_list_b = [4, 5, false, 6]
IO.puts(length(linked_list_a ++ linked_list_b))
IO.puts(length(linked_list_a -- [true]))

new_list = [1, 2, 3]
IO.puts(hd(new_list))
for n <- tl(new_list), do: IO.puts(n)

IO.puts([104, 101, 108, 108, 111] == 'hello')

new_tuple = {:a, :b, :c, :d}
even_more_new_tuple = put_elem(new_tuple, 2, :e)
for n <- 0..tuple_size(new_tuple) - 1, do: IO.puts(elem(new_tuple, n))
for n <- 0..tuple_size(even_more_new_tuple) - 1, do: IO.puts(elem(even_more_new_tuple, n))
