# Elixir Prime Table [![Build Status](https://travis-ci.org/simonewebdesign/elixir_prime_table.svg?branch=master)](https://travis-ci.org/simonewebdesign/elixir_prime_table) [![Coverage Status](https://coveralls.io/repos/github/simonewebdesign/elixir_prime_table/badge.svg?branch=master)](https://coveralls.io/github/simonewebdesign/elixir_prime_table?branch=master)

An application written in Elixir that takes numeric input (N) from a user and outputs a multiplication table of (N) prime numbers. E.g. when N is 3:

    |      |    2 |    3 |    5 |
    |    2 |    4 |    6 |   10 |
    |    3 |    6 |    9 |   15 |
    |    5 |   10 |   15 |   25 |

## How to run it

**Prerequisites**: you'll need at least Erlang/OTP 19, even if you use the precompiled binaries. Elixir is not needed unless you want to build from source.

You can find precompiled binaries under [releases](https://github.com/simonewebdesign/elixir_prime_table/releases).

Alternatively clone this repo and compile from source:

    git clone git@github.com:simonewebdesign/elixir_prime_table.git
    MIX_ENV=prod mix do deps.get, escript.build

This will produce an executable under bin/, which you can run like this:

    $ bin/prime-table 3
    |    |  2 |  3 |  5 |
    |  2 |  4 |  6 | 10 |
    |  3 |  6 |  9 | 15 |
    |  5 | 10 | 15 | 25 |

### How to run the tests

    MIX_ENV=test mix do deps.get, test

### Running from the console

You can also use `iex -S mix` to start a REPL and play with the functions.

Here's a sample session:

``` elixir
Interactive Elixir (1.5.0-dev) - press Ctrl+C to exit (type h() ENTER for help)

iex(1)> h Primes.
first/1                   multiplication_table/1    prime/1
prime?/1

iex(1)> h Primes.first

                                  def first(n)

Returns the first N prime numbers.

## Examples

    iex> Primes.first(3) |> Enum.to_list
    [2, 3, 5]


iex(2)> Primes.first(10000)
#Stream<[enum: #Function<61.23029141/2 in Stream.unfold/2>,
 funs: [#Function<40.23029141/1 in Stream.filter/2>,
  #Function<55.23029141/1 in Stream.take/2>]]>

iex(3)> Primes.first(10000) |> Enum.to_list
[2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73,
 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157,
 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, ...]

iex(4)> Primes.first(10000) |> Enum.to_list |> List.last
104729

iex(5)> Primes.prime(10000)
104729

iex(6)> Primes.multiplication_table(2)
[[0, 2, 3], [2, 4, 6], [3, 6, 9]]

iex(7)> Table.generate(2)
"|   | 2 | 3 |\n| 2 | 4 | 6 |\n| 3 | 6 | 9 |"

iex(8)> Table.generate(2) |> IO.puts
|   | 2 | 3 |
| 2 | 4 | 6 |
| 3 | 6 | 9 |
:ok
```

See [the docs](https://simonewebdesign.github.io/elixir_prime_table/) for an overview of what's available.


## What I'm pleased with

The solution feels pretty simple and maintainable. It's also very small and side effects free, so it was easy to keep 100% test coverage on each single commit.

The first algorithm I've implemented was naive. I've never done any serious profiling in Elixir, but I was pleased to find it's really easy to do. This is how I was doing it:

    $ time env MIX_ENV=prod mix profile.fprof -e "CLI.main([\"100\"])"

Also the code feels idiomatic to me, it's just pipes all the way.
I think it's really nice to have `|>` everywhere so that one can selectively insert or remove steps while testing.


## What would I do if I had more time

I would try implementing a known algorithm such as the [Sieve of Atkin](https://en.wikipedia.org/wiki/Sieve_of_Atkin); that would definitely speed up things a lot. I'd also leverage Erlang OTP's concurrency.

After that I would spend some time refactoring even further to make it faster and more succint. E.g. the `Table.generate` function should ideally be decoupled from the `Primes` module.


## ToDo

- [x] write an algorithm to solve the prime number generation
- [x] write a function to print a N+1 x N+1 table
- [x] test with very large primes
- [x] check for N to be numeric and > 0
- [x] add mix-test.watch, dogma, credo, dialyzer, ExDoc, ExCoveralls
- [x] provide precompiled binaries for linux and OS X
- [x] upload docs on gh-pages
