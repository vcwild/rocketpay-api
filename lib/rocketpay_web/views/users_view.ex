defmodule RocketpayWeb.UsersView do

  def render("create.json", %{user: %Rocketpay.User{id: id, name: name, nickname: nickname}}) do
    %{
      message: "User created",
      user: %{
        id: id,
        name: name,
        nickname: nickname
      }
    }
  end
end
