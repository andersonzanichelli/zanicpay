defmodule Zanicpay.User.CreateTest do

  use Zanicpay.DataCase, async: true

  alias Zanicpay.User
  alias Zanicpay.User.Create

  describe "call/1" do

    test "when all params are valid, returns an user" do
      params = %{
        name: "Natalie Paquette",
        password: "intercept",
        nickname: "Wattson",
        email: "wattson@apex.com",
        age: 22
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{name: "Natalie Paquette", age: 22, id: ^user_id} = user
    end

    test "when there are invalid params, returns an error" do
      params = %{
        name: "Natalie Paquette",
        password: "intercept",
        nickname: "Wattson",
        email: "wattson@apex.com",
        age: 15
      }

      {:error, changeset} = Create.call(params)

      expected = %{
        age: ["must be greater than or equal to 18"]
      }

      assert expected == errors_on(changeset)
    end
  end
end
