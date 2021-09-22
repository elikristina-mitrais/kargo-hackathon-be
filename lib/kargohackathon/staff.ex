defmodule Kargohackathon.Staff do
  use Ecto.Schema
  import Ecto.Changeset
  alias Kargohackathon.Repo
  alias Kargohackathon.Staff

  schema "staffs" do
    field :first_name, :string
    field :last_name, :string
    field :phone_number, :string
    field :dob, :date
    field :country, :string
    field :status, :string
    field :id_card, :string

    timestamps()
  end

  def changeset(%Staff{} = staff, attrs) do
    staff
    |> cast(attrs, [:first_name, :last_name, :phone_number, :dob, :country, :status, :id_card])
    |> validate_required([:first_name, :last_name, :phone_number, :dob, :country, :status, :id_card])
  end

  def get_list do
    Repo.all(Staff)
  end

  def create_list(attrs \\ %{}) do
    %Staff{}
    |> Staff.changeset(attrs)
    |> Repo.insert()
  end

  def get_detail(id) do
    Repo.get(Staff, id)
  end

  def update_detail(%Staff{} = staff, attrs) do
    staff
    |> Staff.changeset(attrs)
    |> Repo.update()
  end

  def delete_detail(id) do
    Repo.delete(Staff, id)
  end
end
