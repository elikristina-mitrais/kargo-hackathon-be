defmodule KargohackathonWeb.StaffView do
  use KargohackathonWeb, :view
  alias KargohackathonWeb.StaffView

  def render("index.json", %{staff: staff}) do
    %{data: render_many(staff, StaffView, "staff.json")}
  end

  def render("show.json", %{staff: staff}) do
    %{data: render_one(staff, StaffView, "staff.json")}
  end

  def render("staff.json", %{staff: staff}) do
    %{id: staff.id,
      first_name: staff.first_name,
      last_name: staff.last_name,
      phone_number: staff.phone_number,
      dob: staff.dob,
      id_card: staff.id_card,
      country: staff.country,
      status: staff.status}
  end
end
