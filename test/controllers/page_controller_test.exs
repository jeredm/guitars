defmodule Guitars.PageControllerTest do
  use Guitars.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Guitar Wish List!"
  end
end
