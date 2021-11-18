defmodule MyError do
  defexception [message: "default message"]
end

# raise MyError
#raise MyError, message: "custom message"

try do
  raise "oops"
rescue
  e in RuntimeError -> IO.puts(e.message)
end

try do
  raise "oops"
rescue
  RuntimeError -> IO.puts("Error")
end
