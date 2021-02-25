defmodule Zanicpay do

  alias Zanicpay.User.Create, as: UserCreate

  alias Zanicpay.Account.Deposit

  defdelegate create_user(params), to: UserCreate, as: :call

  defdelegate deposit(params), to: Deposit, as: :call

end
