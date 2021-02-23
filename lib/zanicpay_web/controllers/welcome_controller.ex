defmodule ZanicpayWeb.WelcomeController do
  use ZanicpayWeb, :controller

  alias Zanicpay.Number

  def index(conn, %{"filename" => filename}) do
    filename
    |> Number.sum_from_file()
    |> handle_response(conn)
  end

  defp handle_response({:ok, %{result: result}}, conn) do
    conn
    |> put_status(:ok)
    |> json(%{message: "Operation result: #{result}"})
  end

  defp handle_response({:error, reason}, conn) do
    conn
    |> put_status(:bad_request)
    |> json(reason)
  end
end
