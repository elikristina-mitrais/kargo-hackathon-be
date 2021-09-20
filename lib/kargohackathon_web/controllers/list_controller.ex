defmodule KargohackathonWeb.V1.ListController do
  use KargohackathonWeb, :controller

  alias Kargohackathon.List

  def index(conn, _params) do
    lists = List.get_list()
    render(conn, "index.json", lists: lists)
  end

  def edit(conn, _params) do
    json(conn, %{error: 0, error_msg: "edit"})
  end

  def create(conn, %{"list" => list_params}) do
    case List.create_list(list_params) do
      {:ok, list} ->
        json(conn, %{error: 0, error_msg: "create"})
      {:error, %Ecto.Changeset{} = changeset} ->
        json(conn, %{error: 1, error_msg: "create", changeset: changeset})
    end
  end
end
