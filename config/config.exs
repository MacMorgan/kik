# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :logger,
  level: :info

case Mix.env do
  :test ->
    config :kik,
      username: "USERNAME",
      api_key: "API_KEY"

  :dev ->
    config :kik,
      username: "USERNAME",
      api_key: "API_KEY"

  _ -> true
end
