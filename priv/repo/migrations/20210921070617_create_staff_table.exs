defmodule Kargohackathon.Repo.Migrations.CreateStaffTable do
  use Ecto.Migration

  def up do
    create table("staff") do
      add(:first_name, :string)
      add(:last_name, :string)
      add(:phone_number, :string)
      add(:dob, :date)
      add(:id_card, :string)
      add(:country, :string)
      add(:status, :string)
    end

    create constraint("staff", :value_status, check: "status IN ('Active', 'Inactive')")
  end

  def down do
    drop table("staff")
  end
end
