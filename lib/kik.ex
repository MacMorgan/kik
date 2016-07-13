defmodule Kik do

  def config do
    Kik.Models.Config.parse(manager.get("config").body)
  end

  def config(webhook) do
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
