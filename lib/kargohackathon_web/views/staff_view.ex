defmodule KargohackathonWeb.StaffView do
  use KargohackathonWeb, :view
  alias KargohackathonWeb.StaffView

  def render("index.json", %{staffs: staffs}) do
    %{error: 0, error_msg: "", data: %{staffs: render_many(staffs, StaffView, "staff.json")}}
  end

  def render("show.json", %{staff: staff}) do
    %{data: render_one(staff, StaffView, "staff.json")}
  end

  def render("staff.json", %{staff: staff}) do
    %{
      id: staff.id,
      name: "#{staff.first_name} #{staff.last_name}",
      phone: staff.phone_number,
      dob: staff.dob,
      country: staff.country,
      status: staff.status
    }
  end
end