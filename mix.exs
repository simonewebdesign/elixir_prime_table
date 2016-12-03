defmodule ElixirPrimeTable.Mixfile do
  use Mix.Project

  def project do
    [app: :elixir_prime_table,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     escript: escript(),
     deps: deps(),
     test_coverage: [tool: ExCoveralls]
    ]
  end

  defp escript do
    [main_module: CLI, path: "bin/prime-table"]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:mix_test_watch, "~> 0.2", only: :dev},
     {:dogma, "~> 0.1", only: :dev},
     {:credo, "~> 0.5", only: [:dev, :test]},
     {:dialyxir, "~> 0.4", only: [:dev]},
     {:ex_doc, "~> 0.14", only: :dev},
     {:excoveralls, "~> 0.5", only: :test},
    ]
  end
end
