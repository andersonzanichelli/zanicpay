defmodule Zanicpay do

  alias Zanicpay.User.Create, as: UserCreate

  defdelegate create_user(params), to: UserCreate, as: :call

end
