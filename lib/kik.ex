defmodule Kik do

  def config do
    manager.get("config")
  end

  def config(config) do
    manager.post("config", [body: config])
  end

  defp manager do
    Application.get_env(:kik, :request_manager) || Kik.RequestManager
  end

end
