defmodule Table do
  @moduledoc """
  Functions for generating strings representing tables
  """

  @doc """
  Returns a string representing a primes multiplication table, given a size.
  Also accepts an optional padding and a separator.

  ## Examples

      iex> Table.generate(2)
      "|   | 2 | 3 |
      | 2 | 4 | 6 |
      | 3 | 6 | 9 |"

      iex> Table.generate(3, 2)
      "|      |    2 |    3 |    5 |
      |    2 |    4 |    6 |   10 |
      |    3 |    6 |    9 |   15 |
      |    5 |   10 |   15 |   25 |"

      iex> Table.generate(3, 0, "¦")
      "¦    ¦  2 ¦  3 ¦  5 ¦
      ¦  2 ¦  4 ¦  6 ¦ 10 ¦
      ¦  3 ¦  6 ¦  9 ¦ 15 ¦
      ¦  5 ¦ 10 ¦ 15 ¦ 25 ¦"
  """
  @spec generate(pos_integer(), String.t) :: String.t
  def generate(size, padding \\ 0, separator \\ "|") do
    margin = size
    |> Primes.prime
    |> (& &1 * &1).()
    |> to_string
    |> String.length

    size
    |> Primes.multiplication_table
    |> Enum.map(fn row ->
      Enum.map(row, fn i ->
        case i do
          0 -> " "
          n -> Integer.to_string(n)
        end
        |> String.pad_leading(margin + padding)
        |> (& "#{separator} #{&1} ").()
      end)
    end)
    |> Enum.join("#{separator}\n")
    |> Kernel.<>(separator)
  end
end
