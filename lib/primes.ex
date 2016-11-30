defmodule Primes do

  @moduledoc """
  Returns true if the number is prime, false otherwise.

  ## Examples

  iex> Primes.prime? 1
  true

  iex> Primes.prime? 2
  true

  iex> Primes.prime? 7
  true

  iex> Primes.prime? 42
  false

  iex> Primes.prime? -3
  false
  """
  def prime?(1), do: true
  def prime?(number) when number > 1 do
    1..number
    |> Stream.filter(&rem(number, &1) == 0)
    |> Enum.count == 2
  end
  def prime?(_), do: false
end
