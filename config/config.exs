# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :zanicpay,
  ecto_repos: [Zanicpay.Repo]

# Configures the endpoint
config :zanicpay, ZanicpayWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Jf17saG72xH/OX4lBFdi1oFvx1hcMMNqv7RuXsMN5gp3sgbblXJd924VvuP0aedw",
  render_errors: [view: ZanicpayWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Zanicpay.PubSub,
  live_view: [signing_salt: "mE0oqMqg"]

  config :zanicpay, Zanicpay.Repo,
    migration_primary_key: [type: :binary_id],
    migration_foreign_key: [type: :binary_id]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
