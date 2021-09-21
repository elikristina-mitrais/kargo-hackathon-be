defmodule KargohackathonWeb.V1.ListView do
  use KargohackathonWeb, :view

  def render("index.json", %{lists: lists}) do
    %{error: 0, error_msg: "", data: %{lists: render_many(lists, KargohackathonWeb.V1.ListView, "detail.json")}}
  end

  def render("detail.json", %{list: list}) do
    %{
      id: list.id,
      name: list.name
    }
  end

  def render("show.json", %{list: list}) do
    %{error: 0, error_msg: "", data: %{list: render_one(list, KargohackathonWeb.V1.ListView, "detail.json")}}
  end
end
