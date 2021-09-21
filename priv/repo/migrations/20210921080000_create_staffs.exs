defmodule Hello.Repo.Migrations.CreateStaffs do
  use Ecto.Migration

  def change do
    create table(:staffs) do
      add :first_name, :string, size: 50
      add :last_name, :string, size: 50
      add :phone_number, :string, size: 20
      add :dob, :date
      add :country, :string, size: 50
      add :status, :string, size: 10
      add :id_card, :text

      timestamps()
    end

  end
end
