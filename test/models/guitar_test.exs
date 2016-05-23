defmodule Guitars.GuitarTest do
  use Guitars.ModelCase

  alias Guitars.Guitar

  @valid_attrs %{description: "some content", manufacturer: "some content", year: "some content", model: "some content", color: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Guitar.changeset(%Guitar{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Guitar.changeset(%Guitar{}, @invalid_attrs)
    refute changeset.valid?
  end
end
