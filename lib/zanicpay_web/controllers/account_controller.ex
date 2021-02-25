defmodule ZanicpayWeb.AccountController do

  use ZanicpayWeb, :controller

  alias Zanicpay.Account
  alias Zanicpay.Account.Transaction.Response, as: TransactionResponse

  action_fallback ZanicpayWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- Zanicpay.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def withdraw(conn, params) do
    with {:ok, %Account{} = account} <- Zanicpay.withdraw(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def transaction(conn, params) do
    with {:ok, %TransactionResponse{} = transaction} <- Zanicpay.transaction(params) do
      conn
      |> put_status(:ok)
      |> render("transaction.json", transaction: transaction)
    end
  end

end
