defmodule Zanicpay.NumberTest do

  use ExUnit.Case

  alias Zanicpay.Number

  describe "sum_from_file/1" do

    test "when there is a file with the given name, returns the sum of numbers" do
      response = Number.sum_from_file("numbers")
      expected_response = {:ok, %{result: 37}}

      assert response == expected_response
    end

    test "when there isnt a file with the given name, returns a error" do
      response = Number.sum_from_file("potato")
      expected_response = {:error, %{message: "Invalid file"}}

      assert response == expected_response
    end
  end
end
