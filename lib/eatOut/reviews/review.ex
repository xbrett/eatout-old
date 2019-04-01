defmodule EatOut.Reviews.Review do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reviews" do
    field :desc, :string
    field :rating, :integer
    field :rest_id, :integer #TODO 
    #field :user, :id

    belongs_to :user, EatOut.Users.User, foreign_key: :user_id

    timestamps()
  end

  @doc false
  def changeset(review, attrs) do
    review
    |> cast(attrs, [:desc, :rating, :rest_id, :user_idse])
    |> unique_constraint([:user_id, :rest_id])
    |> validate_required([:desc, :rating, :rest_id, :user_id])
  end
end
