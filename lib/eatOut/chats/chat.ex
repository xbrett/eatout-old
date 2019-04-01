defmodule EatOut.Chats.Chat do
  use Ecto.Schema
  import Ecto.Changeset

  schema "chats" do
    field :message, :string
    # field :sender, :id
    # field :receiver, :id

    belongs_to :sender, EatOut.Users.User, foreign_key: :sender_id
    belongs_to :receiver, EatOut.Users.User, foreign_key: :receiver_id

    timestamps()
  end

  @doc false
  def changeset(chat, attrs) do
    chat
    |> cast(attrs, [:message, :sender_id, :receiver_id])
    |> validate_required([:message, :sender_id, :receiver_id])
  end
end
