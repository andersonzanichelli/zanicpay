defmodule ZanicpayWeb.FallbackController do

  use ZanicpayWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(ZanicpayWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
