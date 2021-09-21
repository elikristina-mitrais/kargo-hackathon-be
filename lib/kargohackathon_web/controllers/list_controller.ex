defmodule KargohackathonWeb.V1.ListController do
  use KargohackathonWeb, :controller

  alias Kargohackathon.List

  def index(conn, _params) do
    lists = List.get_list()
    render(conn, "index.json", lists: lists)
  end

  def show(conn, %{"id" => id}) do
    list = List.get_detail(id)
    render(conn, "show.json", list: list)
  end

  def create(conn, %{"list" => list_params}) do
    case List.create_list(list_params) do
      {:ok, list} ->
        json(conn, %{error: 0, error_msg: ""})
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(KargohackathonWeb.ErrorView, "error.json", changeset: changeset)
    end
  end

  def update(conn, %{"id" => id, "list" => list_params}) do
    json(conn, %{error: 0, error_msg: "update"})
  end
end
