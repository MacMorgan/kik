defmodule Kik do

  def config do
    Poison.decode!(manager.get("config").body, as: %Kik.Models.Config{})
  end

  def config(config) do
    manager.post("config", [body: config])
  end

  defp manager do
    Application.get_env(:kik, :request_manager) || Kik.RequestManager
  end

end
