defmodule Kargohackathon.List do
  use Ecto.Schema
  import Ecto.Changeset
  alias Kargohackathon.Repo
  alias Kargohackathon.List

  schema "lists" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%List{} = list, attrs) do
    list
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end

  def get_list do
    Repo.all(List)
  end

  def create_list(attrs \\ %{}) do
    %List{}
    |> List.changeset(attrs)
    |> Repo.insert()
  end
end
