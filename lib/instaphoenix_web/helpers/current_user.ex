defmodule InstaphoenixWeb.Helpers.CurrentUser do
  import Plug.Conn

  alias Instaphoenix.Accounts
  alias Instaphoenix.Accounts.User

  def init(opts), do: opts

  def call(conn, _opts) do
    conn.assigns[:current_user] || load_current_user(conn)
  end

  defp load_current_user(conn) do
    if user_id = get_session(conn, :current_user_id) do
      current_user = Accounts.get_user!(user_id)

      conn
      |> assign(:current_user, current_user)
    end
  end
end