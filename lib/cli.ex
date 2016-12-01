defmodule CLI do
  @moduledoc """
  A command line interface.
  The executable will accept only one numeric argument that is greater than zero
  and will print a primes multiplication table.

  ## Examples

      $ bin/prime-table 2
      |   | 2 | 3 |
      | 2 | 4 | 6 |
      | 3 | 6 | 9 |
  """
  @spec main(list(binary)) :: :ok
  def main([]),    do: IO.puts "usage: bin/prime-table <NUMBER>"
  def main(["0"]), do: IO.puts "please provide a number greater than zero"
  def main([arg]) do
    arg
    |> String.to_integer
    |> Table.generate
    |> IO.puts
  rescue
    error -> exit("#{error.message}: #{arg}")
  end
end
