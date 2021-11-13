string = "Hello world"
IO.puts(is_binary(string))

IO.puts(?a)
IO.puts(?l)

IO.puts("\u0061" === "a") # True

IO.puts(0x0061 = 97 = ?a)

string = "héllo"
IO.puts(String.length(string)) # 5
IO.puts(length(String.to_charlist(string))) # 6
IO.puts(byte_size(string)) # 7

x = <<42>>
y = <<42::8>>
IO.puts(x === y)

<<head, rest::binary>> = "banana"
IO.puts(head) # 98 = ?b
IO.puts(rest) # anana

IO.puts('hello')
IO.puts(is_list('hello'))

'this' ++ 'works'

"this" <> "also works"
