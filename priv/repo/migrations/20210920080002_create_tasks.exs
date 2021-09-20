defmodule Hello.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :list_id, :bigint
      add :title, :string, size: 50
      add :description, :text
      add :is_completed, :smallint, default: 0

      timestamps()
    end

    create index("tasks", [:list_id], comment: "Index List")
  end
end
