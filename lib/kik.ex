defmodule Kik do
  require Logger
  require Kik.RequestManager
  require HTTPotion

  def config do
    Kik.Models.Config.parse(manager.get("config").body)
  end

  def config(webhook) do
    HTTPotion.post(
      "https://api.kik.com/v1/config",
      [
        basic_auth: {"tonicdesignbot", "ecdaa93e-f233-4e8c-8c74-7caaee896e1d"},
        body: "{\"webhook\": \"https://0ef0244d.ngrok.io/kik/webhook\",\"features\": {\"manuallySendReadReceipts\": false,\"receiveReadReceipts\": false,\"receiveDeliveryReceipts\": false,\"receiveIsTyping\": false}}",
        headers: ["Content-Type": "application/json"]
      ]
    )
  end

  defp manager do
    Application.get_env(:kik, :request_manager) || Kik.RequestManager
  end

end
