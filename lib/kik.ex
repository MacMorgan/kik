defmodule Kik do
  require Logger

  def config do
    manager.get("config").body
  end

  def config(webhook) do
    config = %{
      "webhook": webhook,
      "features": %{
        "manuallySendReadReceipts": false,
        "receiveReadReceipts": false,
        "receiveDeliveryReceipts": false,
        "receiveIsTyping": false
      }
    }
    body = Poison.encode!(config)
    manager.post!("config", [body: body])
  end

  defp manager do
    Application.get_env(:kik, :request_manager) || Kik.RequestManager
  end

end
