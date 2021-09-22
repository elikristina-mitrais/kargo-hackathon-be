defmodule KargohackathonWeb.StaffControllerTest do
  use KargohackathonWeb.ConnCase

  alias Kargohackathon.Schema
  alias Kargohackathon.Schema.Staff

  @create_attrs %{
    country: "some country",
    dob: ~D[2010-04-17],
    first_name: "some first_name",
    id_card: "some id_card",
    last_name: "some last_name",
    phone_number: "some phone_number",
    status: "some status"
  }
  @update_attrs %{
    country: "some updated country",
    dob: ~D[2011-05-18],
    first_name: "some updated first_name",
    id_card: "some updated id_card",
    last_name: "some updated last_name",
    phone_number: "some updated phone_number",
    status: "some updated status"
  }
  @invalid_attrs %{country: nil, dob: nil, first_name: nil, id_card: nil, last_name: nil, phone_number: nil, status: nil}

  def fixture(:staff) do
    {:ok, staff} = Schema.create_staff(@create_attrs)
    staff
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all staffs", %{conn: conn} do
      conn = get(conn, Routes.staff_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create staff" do
    test "renders staff when data is valid", %{conn: conn} do
      conn = post(conn, Routes.staff_path(conn, :create), staff: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.staff_path(conn, :show, id))

      assert %{
               "id" => id,
               "country" => "some country",
               "dob" => "2010-04-17",
               "first_name" => "some first_name",
               "id_card" => "some id_card",
               "last_name" => "some last_name",
               "phone_number" => "some phone_number",
               "status" => "some status"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.staff_path(conn, :create), staff: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update staff" do
    setup [:create_staff]

    test "renders staff when data is valid", %{conn: conn, staff: %Staff{id: id} = staff} do
      conn = put(conn, Routes.staff_path(conn, :update, staff), staff: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.staff_path(conn, :show, id))

      assert %{
               "id" => id,
               "country" => "some updated country",
               "dob" => "2011-05-18",
               "first_name" => "some updated first_name",
               "id_card" => "some updated id_card",
               "last_name" => "some updated last_name",
               "phone_number" => "some updated phone_number",
               "status" => "some updated status"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, staff: staff} do
      conn = put(conn, Routes.staff_path(conn, :update, staff), staff: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete staff" do
    setup [:create_staff]

    test "deletes chosen staff", %{conn: conn, staff: staff} do
      conn = delete(conn, Routes.staff_path(conn, :delete, staff))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.staff_path(conn, :show, staff))
      end
    end
  end

  defp create_staff(_) do
    staff = fixture(:staff)
    %{staff: staff}
  end
end
