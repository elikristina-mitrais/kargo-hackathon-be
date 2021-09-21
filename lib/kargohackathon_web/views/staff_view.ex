defmodule KargohackathonWeb.V1.StaffView do
  use KargohackathonWeb, :view

  def render("index.json", %{staffs: staffs}) do
    %{error: 0, error_msg: "", data: %{staffs: render_many(staffs, KargohackathonWeb.V1.StaffView, "detail.json")}}
  end

  def render("detail.json", %{staff: staff}) do
    %{
      id: staff.id,
      name: "#{staff.first_name} #{staff.last_name}",
      phone: staff.phone_number,
      dob: staff.dob,
      country: staff.country,
      status: staff.status,
    }
  end

  def render("show.json", %{staff: staff}) do
    %{error: 0, error_msg: "", data: %{staff: render_one(staff, KargohackathonWeb.V1.StaffView, "detail.json")}}
  end
end
