defmodule Guitars.Repo.Migrations.CreateGuitar do
  use Ecto.Migration

  def change do
    create table(:guitars) do
      add :name, :string
      add :year, :string
      add :description, :string

      timestamps
    end

  end
end
