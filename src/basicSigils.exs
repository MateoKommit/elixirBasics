regex = ~r/foo|bar/
IO.puts("foo" =~ regex)
IO.puts("bat" =~ regex)

IO.puts("HELLO" =~ ~r/hello/)
IO.puts("HELLO" =~ ~r/hello/i)

double_quotes_string = ~s(this is a string with "double" quotes)
IO.puts(double_quotes_string)

single_quotes_string = ~c(this is a string with 'single' quotes)
IO.puts(single_quotes_string)

list_of_words = ~w(this is a list representation of a string)
msg = for n <- list_of_words, do: n <> " "
IO.puts(msg)

list_of_words_as_chars = ~w(this is a list representation of a string)c
msg_chars = for n <- list_of_words_as_chars, do: n ++ " "
IO.puts(msg_chars)

list_of_words_as_strings = ~w(this is a list representation of a string)s
msg_strings = for n <- list_of_words_as_strings, do: n <> " "
IO.puts(msg_strings)

list_of_words_as_atoms = ~w(this is a list representation of a string)a
msg_atoms = for n <- list_of_words_as_atoms, do: to_string(n) <> " "
IO.puts(msg_atoms)

escape_interpolated = ~s(String with escape codes \x26 #{"inter" <> "polation"})
IO.puts(escape_interpolated)

escape_non_interpolated = ~S(String without escape codes \x26 #{interpolation})
IO.puts(escape_non_interpolated)

multiline_string = ~s"""
This is
a heredoc string
"""
IO.puts(multiline_string)

date = ~D[2021-11-19]
IO.puts(date.day)

time = ~T[23:00:07.0]
IO.puts(time.second)

naive_date_time = ~N[2021-11-19 23:00:07]
IO.puts(naive_date_time)

utc_date_time = ~U[2021-11-19 19:59:03Z]
IO.puts(utc_date_time)
