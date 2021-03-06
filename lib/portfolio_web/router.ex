defmodule PortfolioWeb.Router do
  use PortfolioWeb, :router

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

  scope "/", PortfolioWeb do
    pipe_through :browser

		get "/", HomeController, :index
		# using home page as "about" for now
		# get "/about", AboutController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", PortfolioWeb do
  #   pipe_through :api
  # end
end
