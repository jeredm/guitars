defmodule Guitars.PageController do
  use Guitars.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
