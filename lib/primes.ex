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

  iex> Primes.prime? 7
  true

  iex> Primes.prime? 42
  false

  iex> Primes.prime? -3
  false
  """
  @spec prime?(number()) :: boolean
  def prime?(n) when n > 1 do
    1..n
    |> Stream.filter(&rem(n, &1) == 0)
    |> Enum.count == 2
  end
  def prime?(_), do: false

  @doc """
  Returns the first N prime numbers.

  ## Examples

  iex> Primes.first(3)
  [2, 3, 5]
  """
  @spec first(pos_integer()) :: list
  def first(0), do: []
  def first(n) when n > 0 do
    2
    |> Stream.iterate(increment())
    |> Stream.filter(&prime?(&1))
    |> Stream.take(n)
    |> Enum.to_list
  end

  defp increment, do: &(&1 + 1)
end
