defmodule Person do
  @moduledoc """
  This is a module that blah blah blah
  """
  @typedoc """
  A 4 digit year, e.g 1984
  """

  @type error_map :: %{
    message: String.t,
    line_numer: integer
  }

  @type year :: integer

  @spec current_age(year) :: integer()
  def current_age(year_of_birth), do:
  "#{year_of_birth} years old"
end

defmodule LousyCalculator do
  @moduledoc """
  This module is for blah blah blah
  """
  @spec add(number, number) :: {number, String.t}
  def add(x, y), do: {
    x + y,
    "You need a calculator for that?!"
  }

  @spec multiply(number, number) :: {number, String.t}
  def multiply(x, y), do: {x * y, "Jeez, come on!"}
end

defmodule Parser do
  @moduledoc """
  This modules implements parser funtionalities
  """

  @doc """
  Parses a string
  """
  @callback parse(String.t) :: {:ok, term} | {:error, String.t}

  @doc """
  Lists all support file extensions
  """
  @callback extensions() :: [String.t]

  def parse!(implementation, contents) do
    case implementation.parse(contents) do
      {:ok, data} -> data
      {:error, error} -> raise ArgumentError, "parsing error: #{error}"
    end
  end
end

defmodule JSONParser do
  @moduledoc """
  Json parser
  """
  @behaviour Parser

  @impl Parser
  def parse(str), do: {:ok, "some json " <> str}

  @impl Parser
  def extensions, do: ["json"]
end

defmodule YAMLParser do
  @moduledoc """
  Yaml parser
  """
  @behaviour Parser

  @impl Parser
  def parse(str), do: {:ok, "some yaml" <> str}

  @impl Parser
  def extensions, do: ["yml"]
end
