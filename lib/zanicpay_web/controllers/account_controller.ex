defmodule ZanicpayWeb.AccountController do

  use ZanicpayWeb, :controller

  alias Zanicpay.Account

  action_fallback ZanicpayWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- Zanicpay.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end

  end

end
