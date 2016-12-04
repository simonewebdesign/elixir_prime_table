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

    MIX_ENV=prod mix deps.get compile

This will produce an executable under bin/, which you can run like this:

    $ bin/prime-table 3

### How to run the tests

    MIX_ENV=test mix do deps.get, test

### Running from the console

You can also use `iex -S mix` to start a REPL and play with the functions.


## What I'm pleased with

The solution feels pretty simple and maintainable. It's also very small and side effects free, so it was easy to keep 100% test coverage on each single commit.

The first algorithm I've implemented was naive. I've never done any serious profiling in Elixir, but I was pleased to find it's really easy to do. This is how I was doing it:

    $ time env MIX_ENV=prod mix profile.fprof -e "CLI.main([\"100\"])"

Also the code feels idiomatic to me, it's just pipes all the way.
I think it's really nice to have `|>` everywhere so that one can selectively insert or remove steps while testing.


## What would I do if I had more time

I would try implementing a known algorithm such as the [Sieve of Atkin](https://en.wikipedia.org/wiki/Sieve_of_Atkin); that would definitely speed up things a lot. I'd also leverage Erlang OTP's concurrency.
After that I would spend some time to refactor even further to make it faster and more succint.
~~The `Table.generate` function needs more love especially, also because the formatting is not pretty; I would add some equal padding between columns.~~


## ToDo

- [x] write an algorithm to solve the prime number generation
- [x] write a function to print a N+1 x N+1 table
- [x] test with very large primes
- [x] check for N to be numeric and > 0
- [x] add mix-test.watch, dogma, credo, dialyzer, ExDoc, ExCoveralls
- [ ] provide precompiled binaries for linux and OS X
- [ ] upload docs on gh-pages
