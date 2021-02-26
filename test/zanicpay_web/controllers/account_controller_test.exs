defmodule ZanicpayWeb.AccountControllerTest do

  use ZanicpayWeb.ConnCase

  alias Zanicpay.{Account, User}

  describe "deposit/2" do

    setup %{conn: conn} do
      params = %{
        name: "Natalie Paquette",
        password: "intercept",
        nickname: "Wattson",
        email: "wattson@apex.com",
        age: 22
      }

      {:ok, %User{account: %Account{id: account_id}}} = Zanicpay.create_user(params)

      conn = put_req_header(conn, "authorization", "Basic cG90YXRvOmZyZW5jaDEyMw==")

      {:ok, conn: conn, account_id: account_id}
    end

    test "when all params are valid, make the deposit", %{conn: conn, account_id: account_id} do
      params = %{"value" => "5.00"}

      response = conn
      |> post(Routes.account_path(conn, :deposit, account_id, params))
      |> json_response(:ok)

      assert %{
        "account" => %{"balance" => "5.00", "id" => _id},
        "message" => "Balance changed successfuly"
      } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn, account_id: account_id} do
      params = %{"value" => "banana"}

      response = conn
      |> post(Routes.account_path(conn, :deposit, account_id, params))
      |> json_response(:bad_request)

      expected = %{"message" => "Invalid deposit value!"}

      assert  expected == response
    end
  end
end
