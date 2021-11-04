defmodule GraphyWeb.PageController do
  use GraphyWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
