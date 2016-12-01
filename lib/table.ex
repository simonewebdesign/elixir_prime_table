defmodule Table do
  @moduledoc """
  Functions for generating strings representing tables
  """

  @doc """
  Returns a string representing a primes multiplication table, given a size.

  ## Examples

      iex> Table.generate(2)
      "|   | 2 | 3 |
      | 2 | 4 | 6 |
      | 3 | 6 | 9 |"
  """
  @spec generate(pos_integer(), String.t) :: String.t
  def generate(size, separator \\ "|") do
    size
    |> Primes.multiplication_table
    |> Enum.map(fn row ->
      Enum.map(row, fn
        0 -> "#{separator}   "
        i -> "#{separator} #{i} "
      end)
    end)
    |> Enum.join("#{separator}\n")
    |> Kernel.<>(separator)
  end
end
