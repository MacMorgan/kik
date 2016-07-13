defmodule Kik do
  require Logger

  def config do
    manager.get("config").body
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
    body = Poison.encode!(newConfig)
    manager.post("config", [body: body])
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

  defp manager do
    Application.get_env(:kik, :request_manager) || Kik.RequestManager
  end

end
