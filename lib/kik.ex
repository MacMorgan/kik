defmodule Kik do
  require Logger

  def config do
    Logger.debug "testing"
    Kik.Models.Config.parse(manager.get("config").body)
  end

  def config(webhook) do
    Logger.debug webhook
    manager.post("config", [body: %{
      "webhook": webhook,
      "features": %{
        "manuallySendReadReceipts": false,
        "receiveReadReceipts": false,
        "receiveDeliveryReceipts": false,
        "receiveIsTyping": false
      }
    }])
  end

  defp manager do
    Application.get_env(:kik, :request_manager) || Kik.RequestManager
  end

end
