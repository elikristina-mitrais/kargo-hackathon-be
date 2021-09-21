defmodule KargohackathonWeb.V1.StaffController do
  use KargohackathonWeb, :controller

  alias Kargohackathon.Staff

  @spec index(Plug.Conn.t(), any) :: Plug.Conn.t()
  def index(conn, _params) do
    staffs = Staff.get_list()
    render(conn, "index.json", staffs: staffs)
  end

  def show(conn, %{"id" => id}) do
    staff = Staff.get_detail(id)
    render(conn, "show.json", staff: staff)
  end

  def create(conn, %{"staff" => staff_params}) do
    case Staff.create_list(staff_params) do
      {:ok, staff} ->
        json(conn, %{error: 0, error_msg: ""})
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(KargohackathonWeb.ErrorView, "error.json", changeset: changeset)
    end
  end
end
