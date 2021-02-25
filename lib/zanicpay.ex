defmodule Zanicpay do

  alias Zanicpay.User.Create, as: UserCreate

  alias Zanicpay.Account.{Deposit, Withdraw}

  defdelegate create_user(params), to: UserCreate, as: :call

  defdelegate deposit(params), to: Deposit, as: :call
  defdelegate withdraw(params), to: Withdraw, as: :call

end
