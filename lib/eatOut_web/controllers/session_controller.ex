defmodule EatOutWeb.SessionController do
  use EatOutWeb, :controller

  action_fallback EatOutWeb.FallbackController

  alias EatOut.Users.User

  def create(conn, %{"email" => email, "password" => password}) do
    with %User{} = user <- EatOut.Users.get_and_auth_user(email, password) do
      resp = %{
        data: %{
          token: Phoenix.Token.sign(EatOutWeb.Endpoint, "user_id", user.id),
          user_id: user.id,
          user_name: user.name
        }
      }
      conn
      |> put_resp_header("content-type", "application/json; charset=utf-8")
      |> send_resp(:created, Jason.encode!(resp))
    end
  end
end
