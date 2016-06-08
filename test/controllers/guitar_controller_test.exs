defmodule Guitars.GuitarControllerTest do
  use Guitars.ConnCase

  alias Guitars.Guitar
  @valid_attrs %{description: "some content", manufacturer: "some content", year: "some content", model: "some content", color: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, guitar_path(conn, :index)
    assert html_response(conn, 200) =~ "Wish List of Amazing Guitars!"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, guitar_path(conn, :new)
    assert html_response(conn, 200) =~ "New guitar"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, guitar_path(conn, :create), guitar: @valid_attrs
    assert redirected_to(conn) == guitar_path(conn, :index)
    assert Repo.get_by(Guitar, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, guitar_path(conn, :create), guitar: @invalid_attrs
    assert html_response(conn, 200) =~ "New guitar"
  end

  test "shows chosen resource", %{conn: conn} do
    guitar = Repo.insert! %Guitar{}
    conn = get conn, guitar_path(conn, :show, guitar)
    assert html_response(conn, 200) =~ "Guitar No."
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, guitar_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    guitar = Repo.insert! %Guitar{}
    conn = get conn, guitar_path(conn, :edit, guitar)
    assert html_response(conn, 200) =~ "Edit guitar"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    guitar = Repo.insert! %Guitar{}
    conn = put conn, guitar_path(conn, :update, guitar), guitar: @valid_attrs
    assert redirected_to(conn) == guitar_path(conn, :index)
    assert Repo.get_by(Guitar, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    guitar = Repo.insert! %Guitar{}
    conn = put conn, guitar_path(conn, :update, guitar), guitar: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit guitar"
  end

  test "deletes chosen resource", %{conn: conn} do
    guitar = Repo.insert! %Guitar{}
    conn = delete conn, guitar_path(conn, :delete, guitar)
    assert redirected_to(conn) == guitar_path(conn, :index)
    refute Repo.get(Guitar, guitar.id)
  end
end
