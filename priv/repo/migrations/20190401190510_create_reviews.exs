defmodule EatOut.Repo.Migrations.CreateReviews do
  use Ecto.Migration

  def change do
    create table(:reviews) do
      add :desc, :text
      add :rating, :integer
      add :rest_id, :integer
      add :user, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create index(:reviews, [:user])
  end
end
