defmodule Guitars.Repo.Migrations.UpdateFieldsGuitars do
  use Ecto.Migration

  def change do
    rename table(:guitars), :name, to: :manufacturer
    alter table(:guitars) do
      add :model, :string
    end
  end
end
