defmodule Kargohackathon.Repo.Migrations.CreateStaffs do
  use Ecto.Migration

  def change do
    create table(:staffs) do
      add :first_name, :string
      add :last_name, :string
      add :phone_number, :string
      add :dob, :date
      add :id_card, :string
      add :country, :string
      add :status, :string

      timestamps()
    end

    create constraint("staffs", :value_status, check: "status IN ('Active', 'Inactive')")

  end
end
