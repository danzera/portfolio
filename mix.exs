defmodule Portfolio.MixProject do
  use Mix.Project

  def project do
    [
      app: :portfolio,
      version: "0.1.0",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
			deps: deps()
			# EXAMPLE RELEASE CONFIGURATION
			# CAN SPECIFY MULTIPLE RELEASES
			#  - THE KEY IS THE RELEASE_NAME ("demo" in this example)
			#  - THE VALUE IS A KEYWORD LIST SPECIFYING THE RELEASE CONFIRGURATION DETAILS
			# releases: [
			# 	demo: [
			# 		include_executables_for: [:unix],
			# 		applications: [runtime_tools: :permanent]
			# 	]
			# ]
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Portfolio.Application, []},
      extra_applications: [:logger, :runtime_tools, :bamboo]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
			{:bamboo, "~> 1.4"},
			{:bamboo_smtp, "~> 2.1.0"},
			{:ecto_sql, "~> 3.1"},
			{:gettext, "~> 0.11"},
			{:jason, "~> 1.0"},
			{:phoenix, "~> 1.4.16"},
			{:phoenix_ecto, "~> 4.0"},
			{:phoenix_html, "~> 2.11"},
			{:phoenix_live_reload, "~> 1.2", only: :dev},
			{:phoenix_pubsub, "~> 1.1"},
			{:plug_cowboy, "~> 2.0"},
      {:postgrex, ">= 0.0.0"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
