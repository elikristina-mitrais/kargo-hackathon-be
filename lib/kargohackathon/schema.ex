defmodule Kargohackathon.Schema do
  @moduledoc """
  The Schema context.
  """

  use Ecto.Schema
  import Ecto.Query, warn: false
  alias Kargohackathon.Repo

  alias Kargohackathon.Schema.Staff

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

  def list_staffs do
    Repo.all(Staff)
  end

  def get_staff!(id), do: Repo.get!(Staff, id)


  def create_staff(attrs \\ %{}) do
    %Staff{}
    |> Staff.changeset(attrs)
    |> Repo.insert()
  end

  def update_staff(%Staff{} = staff, attrs) do
    staff
    |> Staff.changeset(attrs)
    |> Repo.update()
  end

  def delete_staff(%Staff{} = staff) do
    Repo.delete(staff)
  end


  def change_staff(%Staff{} = staff, attrs \\ %{}) do
    Staff.changeset(staff, attrs)
  end
end
