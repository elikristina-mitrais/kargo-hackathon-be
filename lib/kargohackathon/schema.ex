defmodule Kargohackathon.Schema do
  @moduledoc """
  The Schema context.
  """

  use Ecto.Schema
  import Ecto.Query, warn: false
  alias Kargohackathon.{Repo, Pagination}

  alias Kargohackathon.Schema.Staff

  schema "staffs" do
    field(:first_name, :string)
    field(:last_name, :string)
    field(:phone_number, :string)
    field(:dob, :date)
    field(:country, :string)
    field(:status, :string)
    field(:id_card, :string)

    timestamps()
  end

  @staffs_per_page 5

  def list_staffs do
    Repo.all(Staff)
  end

  def list_staffs(a, page \\ 1, per_page \\ @staffs_per_page)

  def list_staffs(:paged, page, per_page) do
    Staff
    |> order_by(desc: :first_name)
    |> Pagination.page(page, per_page: per_page)
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
