defmodule EatOutWeb.Router do
  use EatOutWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", EatOutWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/register", PageController, :register
    get "/profile", PageController, :profile
    resources "/reviews", ReviewController
    resources "/chats", ChatController
    resources "/friends", FriendController
  end

  # Other scopes may use custom stacks.
  # scope "/api", EatOutWeb do
  #   pipe_through :api
  # end

  scope "/api/v1", FoodFinderWeb do
    pipe_through :api

    resources "/sessions", SessionController, only: [:create]
    resources "/users", UserController

  end
end
