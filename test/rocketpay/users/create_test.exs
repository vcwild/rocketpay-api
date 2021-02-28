defmodule Rocketpay.Users.CreateTest do
  use Rocketpay.DataCase, async: true
  alias Rocketpay.User
  alias Rocketpay.Users.Create

  describe "call/1" do
    test "when all params are valid, return an user" do
      params = %{
        name: "Gabriel",
        password: "123456",
        nickname: "gabi",
        email: "gabi@mail.com",
        age: 19
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{name: "Gabriel", age: 19, id: ^user_id} = user
    end

    test "when there are invalid params, return an error" do
      params = %{
        name: "Gabriel",
        nickname: "gabi",
        email: "gabi@mail.com",
        age: 15
      }

      {:error, changeset} = Create.call(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["can't be blank"]
      }

      assert expected_response == errors_on(changeset)
    end
  end
end
