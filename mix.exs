defmodule ExTiqets.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_tiqets,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:tesla, "~> 1.3.0"},
      {:jason, ">= 1.0.0"},
      {:ex_doc, "~> 0.21.0", only: :dev}
    ]
  end

  defp description do
    """
    Elixir wrapper for the Tiqets V2 API]
    """
  end

  defp package do
    [
      files: ["lib", "config", "mix.exs", "README", "LICENSE"],
      maintainers: ["Rob Chu"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/RobChooses/ex_tiqets"}
    ]
  end
end
