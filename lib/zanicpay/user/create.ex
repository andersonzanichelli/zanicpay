defmodule Zanicpay.User.Create do

  alias Zanicpay.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
