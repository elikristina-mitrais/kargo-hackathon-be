defmodule Kargohackathon.Repo.Migrations.CreateStaff do
  use Ecto.Migration

  def change do
    create table(:staff) do
      add :first_name, :string
      add :last_name, :string
      add :phone_number, :string
      add :dob, :date
      add :id_card, :string
      add :country, :string
      add :status, Ecto.Enum, values: [:inactive, :active]

      timestamps()
    end

  end
end
