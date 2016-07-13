defmodule Kik do
  require Logger
  require Kik.RequestManager

  def config do
    Kik.Models.Config.parse(manager.get("config").body)
  end

  def config(webhook) do
    Kik.RequestManager.post(
      "config",
      [
        body: %{
          "webhook": "https://0ef0244d.ngrok.io/kik/webhook",
          "features": %{
            "manuallySendReadReceipts": false,
            "receiveReadReceipts": false,
            "receiveDeliveryReceipts": false,
            "receiveIsTyping": false
          }
        }
      ]
    )
  end

  defp manager do
    Application.get_env(:kik, :request_manager) || Kik.RequestManager
  end

end
