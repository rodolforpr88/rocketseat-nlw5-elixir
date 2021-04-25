# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :inmana,
  ecto_repos: [Inmana.Repo]

# configuration to set by default use the UUID as PK or FK
config :inmana, Inmana.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

config :inmana, Inmana.Mailer, adapter: Bamboo.LocalAdapter

# Configures the endpoint
config :inmana, InmanaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XRPHROEScpak6tRSs3W+CyQV42gxMzeVNKlB77i8iszCru1BYmWh27pfxZNUJavz",
  render_errors: [view: InmanaWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Inmana.PubSub,
  live_view: [signing_salt: "eQ8oq2T5"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
