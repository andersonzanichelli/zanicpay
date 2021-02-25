defmodule ZanicpayWeb.AccountView do

  alias Zanicpay.{Account}

  def render("update.json", %{account: %Account{id: account_id, balance: balance}} ) do
    %{
      message: "Balance changed successfuly",
      account: %{
        id: account_id,
        balance: balance
      }
    }
  end
end
