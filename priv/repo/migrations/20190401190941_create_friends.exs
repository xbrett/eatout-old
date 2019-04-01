defmodule EatOut.Repo.Migrations.CreateFriends do
  use Ecto.Migration

  def change do
    create table(:friends) do
      add :friender, references(:users, on_delete: :delete_all)
      add :friendee, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create index(:friends, [:friender])
    create index(:friends, [:friendee])
  end
end
