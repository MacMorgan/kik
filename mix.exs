defmodule Kik.Mixfile do
  use Mix.Project

  def project do
    [app: :kik,
     name: "Kik",
     source_url: "https://github.com/macmorgan/kik",
     version: "0.1.0",
     docs: [ extras: ["README.md"] ],
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     test_coverage: [tool: Coverex.Task, coveralls: true],
     deps: deps,
     package: package,
     description: description]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpotion]]
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
    d = [{:httpotion, "~> 3.0"}]

    if Mix.env == :test do
      [{:coverex, "~> 1.4.8", only: :test}, {:poison, "~> 2.2.0", override: true} | d]
    else
      [{:poison, "~> 2.2.0"} | d]
    end
  end

  defp description do
    """
    Kik is a library that implements the kik api.
    """
  end

  defp package do
    [ files: [ "lib", "mix.exs", "README.md",],
      maintainers: [ "Mac Morgan" ],
      links: %{ "GitHub" => "https://github.com/macmorgan/kik" } ]
  end
end
