defmodule Kik do
  use HTTPotion.Base

  defp username, do: Application.get_env(:kik, :username)

  defp apikey, do: Application.get_env(:kik, :apikey)

  def process_url(url) do
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
    body |> Poison.decode!
  end
end

defmodule Kik.Message do
  @derive [Poison.Encoder]

  defstruct [:body, :chatId, :type, :from]

  @type t :: %Kik.Message{
    body: String.t,
    chatId: String.t,
    type: String.t,
    from: String.t
  }
end
