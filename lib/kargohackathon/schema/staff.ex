defmodule Kargohackathon.Schema.Staff do
  use Ecto.Schema
  import Ecto.Changeset

  schema "staff" do
    field :country, :string
    field :dob, :date
    field :first_name, :string
    field :id_card, :string
    field :last_name, :string
    field :phone_number, :string
    field :status, Ecto.Enum, values: [:inactive, :active]

    timestamps()
  end

  @doc false
  def changeset(staff, attrs) do
    staff
    |> cast(attrs, [:first_name, :last_name, :phone_number, :dob, :id_card, :country, :status])
    |> validate_required([:first_name, :last_name, :phone_number, :dob, :id_card, :country, :status])
  end
end
