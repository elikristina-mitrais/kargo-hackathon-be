defmodule KargohackathonWeb.StaffController do
  use KargohackathonWeb, :controller

  alias Kargohackathon.Schema
  alias Kargohackathon.Schema.Staff

  action_fallback KargohackathonWeb.FallbackController

  def index(conn, _params) do
    staffs = Schema.list_staffs()
    render(conn, "index.json", staffs: staffs)
  end

  def create(conn, %{"staff" => staff_params}) do
    with {:ok, %Staff{} = staff} <- Schema.create_staff(staff_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.staff_path(conn, :show, staff))
      |> render("show.json", staff: staff)
    end
  end

  def show(conn, %{"id" => id}) do
    staff = Schema.get_staff!(id)
    render(conn, "show.json", staff: staff)
  end

  def update(conn, %{"id" => id, "staff" => staff_params}) do
    staff = Schema.get_staff!(id)

    with {:ok, %Staff{} = staff} <- Schema.update_staff(staff, staff_params) do
      render(conn, "show.json", staff: staff)
    end
  end

  def delete(conn, %{"id" => id}) do
    staff = Schema.get_staff!(id)

    with {:ok, %Staff{}} <- Schema.delete_staff(staff) do
      send_resp(conn, :no_content, "")
    end
  end
end
