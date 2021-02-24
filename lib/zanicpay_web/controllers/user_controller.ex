defmodule ZanicpayWeb.UserController do

  use ZanicpayWeb, :controller

  alias Zanicpay.User

  action_fallback ZanicpayWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Zanicpay.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
