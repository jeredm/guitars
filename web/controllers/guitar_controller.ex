defmodule Guitars.GuitarController do
  use Guitars.Web, :controller

  alias Guitars.Guitar

  plug :scrub_params, "guitar" when action in [:create, :update]

  def index(conn, _params) do
    guitars = Repo.all(Guitar)
    render(conn, "index.html", guitars: guitars)
  end

  def new(conn, _params) do
    changeset = Guitar.changeset(%Guitar{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"guitar" => guitar_params}) do
    changeset = Guitar.changeset(%Guitar{}, guitar_params)

    case Repo.insert(changeset) do
      {:ok, _guitar} ->
        conn
        |> put_flash(:info, "Guitar created successfully.")
        |> redirect(to: guitar_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    guitar = Repo.get!(Guitar, id)
    render(conn, "show.html", guitar: guitar)
  end

  def edit(conn, %{"id" => id}) do
    guitar = Repo.get!(Guitar, id)
    changeset = Guitar.changeset(guitar)
    render(conn, "edit.html", guitar: guitar, changeset: changeset)
  end

  def update(conn, %{"id" => id, "guitar" => guitar_params}) do
    guitar = Repo.get!(Guitar, id)
    changeset = Guitar.changeset(guitar, guitar_params)

    case Repo.update(changeset) do
      {:ok, guitar} ->
        conn
        |> put_flash(:info, "Guitar updated successfully.")
        |> redirect(to: guitar_path(conn, :index))
      {:error, changeset} ->
        render(conn, "edit.html", guitar: guitar, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    guitar = Repo.get!(Guitar, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(guitar)

    conn
    |> put_flash(:info, "Guitar deleted successfully.")
    |> redirect(to: guitar_path(conn, :index))
  end
end
