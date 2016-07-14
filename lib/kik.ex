defmodule Kik do
  require Logger

  def config do
    manager.get("config").body |> Kik.Models.Config.parse
  end

  def config(newConfig) when is_map(newConfig), do: manager.post("config", [body: newConfig]) |> process_response

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
    newCode = %{
      "data": data
    }
    manager.post("code", [body: newCode]).body |> Kik.Models.Code.parse
  end

  def send(message) when is_map(message), do: manager.post("message", [body: message])

  def send(to, chatId, body) do
    %Kik.Models.Messages{
      messages: [%Kik.Models.Message{
        body: body,
        to: to,
        type: "text",
        chatId: chatId
      }]
    }
    |> send
  end

  ### TODO: Broadcast

  defp process_response(%HTTPotion.ErrorResponse{} = response) do
    response
  end

  defp process_response(%HTTPotion.Response{status_code: 200, body: body}) do
    body |> Poison.decode! ### TODO: Decode to specific type
  end

  defp process_response(%HTTPotion.Response{status_code: 400, body: body}) do
    body ### TODO: Bad Request
  end

  defp process_response(%HTTPotion.Response{status_code: 401, body: body}) do
    body ### TODO: Unauthorized
  end

  defp process_response(%HTTPotion.Response{status_code: 403, body: body}) do
    body ### TODO: Forbidden
  end

  defp process_response(%HTTPotion.Response{status_code: 429, body: body}) do
    body ### TODO: Rate Limit Exceeded
  end

  defp process_response(%HTTPotion.Response{status_code: 500, body: body}) do
    body ### TODO: Internal Server Error
  end

  defp process_response(%HTTPotion.Response{status_code: 503, body: body}) do
    body ### TODO: Service Unavailable
  end

  defp manager do
    Application.get_env(:kik, :request_manager) || Kik.RequestManager
  end

end
