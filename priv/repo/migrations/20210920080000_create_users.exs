defmodule Hello.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string, size: 100
      add :password, :string, size: 100

      timestamps()
    end

  end
end
