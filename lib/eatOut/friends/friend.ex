defmodule EatOut.Friends.Friend do
  use Ecto.Schema
  import Ecto.Changeset

  schema "friends" do
    # field :friender, :id
    # field :friendee, :id

    belongs_to :friender, EatOut.Users.User, foreign_key: :friender_id
    belongs_to :friendee, EatOut.Users.User, foreign_key: :friendee_id

    timestamps()
  end

  @doc false
  def changeset(friend, attrs) do
    friend
    |> cast(attrs, [:friender_id, :friendee_id])
    |> validate_required([:friender_id, :friendee_id])
  end
end
