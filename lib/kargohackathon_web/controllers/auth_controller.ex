defmodule KargohackathonWeb.V1.AuthController do
  use KargohackathonWeb, :controller

  def create(conn, %{"username" => username, "password" => password}) do
    case username do
      "shipper" ->
        json(conn, %{error: 0, error_msg: "", data: %{"users": %{"id": 1, "username": "shipper", "role": "shipper", "token": "WeC3yhWbDxavg"}}})
      "transporter" ->
        json(conn, %{error: 0, error_msg: "", data: %{"users": %{"id": 2, "username": "transporter", "role": "transporter", "token": "WeC3yhWbDxavg"}}})
      _ ->
        json(conn, %{error: 1, error_msg: "failed to login"})
    end
  end

end
