defmodule Hello.Repo.Migrations.CreateLists do
  use Ecto.Migration

  def change do
    create table(:lists) do
      add :name, :string, size: 50

      timestamps()
    end

  end
end
