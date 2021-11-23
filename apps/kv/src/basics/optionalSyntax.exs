length([1, 2, 3]) === length [1, 2, 3]

if true do
  :this
else
  :that
end

if true, do: :this, else: :that

defmodule(Math, [
  {:do, def(add(a, b), [{:do, a + b}])}
])

defmodule Math do
  def add(a, b) do
  a + b
  end
end

if variable? do
  Call.this()
else
  Call.that()
end

if variable?, do: Call.this(), else: Call.that()
