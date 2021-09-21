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
    |> cast(attrs, [:first_name, :last_name, :phone_number])
    |> validate_required([:first_name, :last_name, :phone_number])
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
end
