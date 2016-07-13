defmodule Kik.RequestManager do
  use HTTPotion.Base
  require Logger
  require Poison

  defp username, do: Application.get_env(:kik, :username)

  defp apikey, do: Application.get_env(:kik, :apikey)

  def process_url(url) do
    Logger.debug "https://api.kik.com/v1/" <> url
    "https://api.kik.com/v1/" <> url
  end

  def process_request_headers(headers) do
    Dict.put headers, :"Content-Type", "application/json"
  end

  def process_options(options) do
    Dict.put options, :basic_auth, { username, apikey }
  end

  def process_request_body(body) do
    body |> Poison.encode!
  end

  def process_response_body(body) do
    Logger.debug body
    body # |> Poison.encode!
  end
end
