defmodule Kik do
  require Logger

  def config do
    manager.get("config").body |> Kik.Models.Config.parse
  end

  def config(webhook) do
    newConfig = %{
      "webhook": webhook,
      "features": %{
        "manuallySendReadReceipts": false,
        "receiveReadReceipts": false,
        "receiveDeliveryReceipts": false,
        "receiveIsTyping": false
      }
    }
    manager.post("config", [body: newConfig])
  end

  def user_profile(username) do
    manager.get("user/" <> username).body |> Kik.Models.UserProfile.parse
  end

  def code(data) do
    newData = %{
      "data": data
    }
    manager.post("code", [body: newData]).body |> Kik.Models.Code.parse
  end

  def send(to, chatId, body) do
    newMessage = %{
      "messages": [%{
        "body" => body,
        "to" => to,
        "type" => "text",
        "chatId" => chatId
      }]
    }
    manager.post("message", [body: newMessage])
  end

  ### TODO: Broadcast

  defp manager do
    Application.get_env(:kik, :request_manager) || Kik.RequestManager
  end

end
