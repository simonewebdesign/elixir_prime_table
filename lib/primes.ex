defmodule Primes do
  @moduledoc """
  Utility functions for working with prime numbers
  """

  @doc """
  Returns true if the number is prime, false otherwise.

  ## Examples

      iex> Primes.prime? 1
      false

      iex> Primes.prime? 2
      true

      iex> Primes.prime? 3
      true

      iex> Primes.prime? 5
      true

      iex> Primes.prime? 6
      false

      iex> Primes.prime? 7
      true

      iex> Primes.prime? 11
      true

      iex> Primes.prime? 23
      true

      iex> Primes.prime? 42
      false

      iex> Primes.prime? 104729
      true

      iex> Primes.prime? -3
      false
  """
  @spec prime?(number()) :: boolean
  def prime?(2), do: true
  def prime?(n) when n > 2 do
    (n |> :math.sqrt |> round)..2
    |> Enum.any?(&rem(n, &1) == 0) # will stop the iteration on the first truthy value
    |> Kernel.!
  end
  def prime?(_), do: false

  @doc """
  Returns the first N prime numbers.

  ## Examples

      iex> Primes.first(3) |> Enum.to_list
      [2, 3, 5]
  """
  @spec first(pos_integer()) :: list
  def first(0), do: []
  def first(n) when n > 0 do
    2
    |> Stream.iterate(increment())
    |> Stream.filter(&prime?(&1))
    |> Stream.take(n)
  end

  defp increment, do: &(&1 + 1)

  @doc """
  Returns a 2D list of primes.

  ## Examples

      iex> Primes.multiplication_table(3)
      [ [ 0,  2,  3,  5 ],
        [ 2,  4,  6, 10 ],
        [ 3,  6,  9, 15 ],
        [ 5, 10, 15, 25 ] ]
  """
  @spec multiplication_table(pos_integer()) :: list(list)
  def multiplication_table(0), do: []
  def multiplication_table(n) when n > 0 do
    primes = first(n)

    matrix = Stream.map(primes, fn i ->
      [ i | Enum.map(primes, fn j -> i * j end) ]
    end)

    [ [ 0 | Enum.to_list(primes) ] | Enum.to_list(matrix) ]
  end
end
