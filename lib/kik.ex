defmodule Kik do
  require Logger

  def config do
    manager.get("config").body |> Kik.Models.Config.parse
  end

  def config(newConfig) when is_map(newConfig), do: manager.post("config", [body: newConfig])

  def config(webhook) do
    %Kik.Models.Config{
      webhook: webhook,
      features: %Kik.Models.ConfigFeatures{
        manuallySendReadReceipts: false,
        receiveReadReceipts: false,
        receiveDeliveryReceipts: false,
        receiveIsTyping: false
      }
    }
    |> config
  end

  def user_profile(username) do
    manager.get("user/" <> username).body |> Kik.Models.UserProfile.parse
  end

  def code(data) when is_map(data), do: Poison.encode!(data) |> code

  def code(data) do
    newData = %{
      "data": data
    }
    manager.post("code", [body: newData]).body |> Kik.Models.Code.parse
  end

  def send(message) when is_map(message), do: manager.post("message", [body: message])

  def send(to, chatId, body) do
    %{
      "messages": [%{
        "body" => body,
        "to" => to,
        "type" => "text",
        "chatId" => chatId
      }]
    }
    |> send
  end

  ### TODO: Broadcast

  defp process_response(response) do
    response
  end

  defp manager do
    Application.get_env(:kik, :request_manager) || Kik.RequestManager
  end

end
