# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :logger,
  level: :info

case Mix.env do
  :test ->
    config :kik,
      username: "USERNAME",
      apikey: "API_KEY",
      request_manager: Kik.RequestManager

  :dev ->
    config :kik,
      username: "USERNAME",
      apikey: "API_KEY",
      request_manager: Kik.RequestManager

  _ -> true
end
