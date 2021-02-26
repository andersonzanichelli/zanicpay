defmodule ZanicpayWeb.UserViewTest do

  use ZanicpayWeb.ConnCase

  import Phoenix.View

  alias Zanicpay.{Account, User}
  alias ZanicpayWeb.UserView

  test "renders create.json" do
    params = %{
      name: "Natalie Paquette",
      password: "intercept",
      nickname: "Wattson",
      email: "wattson@apex.com",
      age: 22
    }

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} = Zanicpay.create_user(params)

    response = render(UserView, "create.json", user: user)

    expected = %{
      message: "User created",
      user: %{
        account: %{
          balance: Decimal.new("0.00"),
          id: account_id
        },
        id: user_id,
        name: "Natalie Paquette",
        nickname: "Wattson"
      }
    }

    assert expected == response
  end

end
