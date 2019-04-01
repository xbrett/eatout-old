defmodule EatOut.Repo.Migrations.CreateChats do
  use Ecto.Migration

  def change do
    create table(:chats) do
      add :message, :text
      add :sender, references(:users, on_delete: :delete_all)
      add :receiver, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create index(:chats, [:sender])
    create index(:chats, [:receiver])
  end
end
