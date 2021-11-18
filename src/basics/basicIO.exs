IO.puts("Hello world")

# IO.gets("Yes or no?")

IO.puts(:stderr, "Hello world")

IO.puts("-----------------------")

{:ok, file} = File.open("hello", [:write])
IO.binwrite(file, "word")
File.close(file)
file_data = File.read("hello")

for n <- 0..tuple_size(file_data) - 1 do
  IO.puts(elem(file_data, n))
end

case File.read("hello") do
  {:ok, body} -> IO.puts("The contents of the file are: #{body}")
  {:error, reason} -> IO.puts("Error while reading file: #{reason}")
end

IO.puts(Path.join("foo", "bar"))
IO.puts(Path.expand("~/hello"))

IO.puts(['hello', ?\s, "world"])
