defmodule EatOutWeb.PageController do
  use EatOutWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
