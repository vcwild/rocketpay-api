defmodule RocketpayWeb.UsersViewTest do
  import Phoenix.View
  use RocketpayWeb.ConnCase, async: true
  alias RocketpayWeb.UsersView
  alias Rocketpay.{User, Account}

  test "renders create.json" do
    params = %{
      name: "Gabriel",
      password: "123456",
      nickname: "gabi",
      email: "gabi@mail.com",
      age: 19
    }

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} = Rocketpay.create_user(params)

    response = render(UsersView, "create.json", user: user)

    expected_response = %{
      message: "User created",
      user: %{
        account: %{
          balance: Decimal.new("0.00"),
          id: account_id
        },
        id: user_id,
        name: "Gabriel",
        nickname: "gabi"
      }
    }

    assert expected_response == response
  end
end
