defmodule RocketpayWeb.AccountsControllerTest do
  use RocketpayWeb.ConnCase, async: true

  alias Rocketpay.{Account, User}

  describe "deposit/2" do
    setup %{conn: conn} do
      params = %{
        name: "Gabriel",
        password: "123456",
        nickname: "gabi",
        email: "gabi@mail.com",
        age: 19
      }

      {:ok, %User{account: %Account{id: account_id}}} = Rocketpay.create_user(params)

      conn = put_req_header(conn, "authorization", "Basic cm9ja2V0cGF5OnJvY2tldHBheQ==")

      {:ok, conn: conn, account_id: account_id}
    end

    test "when all params are valid, deposit into account", %{conn: conn, account_id: account_id} do
      params = %{"value" => "50.00"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:ok)

      assert %{
        "account" => %{"balance" => "50.00", "id" => _id},
        "message" => "Balance updated"
      } = response
    end

    test "when value in params is not numeric, return an error", %{conn: conn, account_id: account_id} do
      params = %{"value" => "not a number"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:bad_request)

      assert %{"message" => "Invalid deposit value!"} = response
    end
  end

  describe "withdraw/2" do
    setup %{conn: conn} do
      params = %{
        name: "Gabriel",
        password: "123456",
        nickname: "gabi",
        email: "gabi@mail.com",
        age: 19
      }

      {:ok, %User{account: %Account{id: account_id}}} = Rocketpay.create_user(params)

      conn = put_req_header(conn, "authorization", "Basic cm9ja2V0cGF5OnJvY2tldHBheQ==")

      {:ok, conn: conn, account_id: account_id}
    end

    test "when all params are valid, return withdraw error balance is invalid", %{conn: conn, account_id: account_id} do
      params = %{"value" => "50.00"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :withdraw, account_id, params))
        |> json_response(:bad_request)

      assert %{"message" => %{"balance" => ["is invalid"]}} = response
    end

    test "when value is not numeric, return withdraw error", %{conn: conn, account_id: account_id} do
      params = %{"value" => "not a number"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :withdraw, account_id, params))
        |> json_response(:bad_request)

      assert %{"message" => "Invalid deposit value!"} = response
    end

    test "when all params are valid, deposit value, then withdraw value from account", %{conn: conn, account_id: account_id} do
      params = %{"value" => "50.00"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> post(Routes.accounts_path(conn, :withdraw, account_id, params))
        |> json_response(:ok)

      assert %{
        "account" => %{"balance" => "0.00", "id" => _id},
        "message" => "Balance updated"
      } = response
    end
  end
end
