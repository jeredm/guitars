defmodule Guitars.Guitar do
  use Guitars.Web, :model

  schema "guitars" do
    field :manufacturer, :string
    field :model, :string
    field :year, :string
    field :color, :string
    field :description, :string

    timestamps
  end

  @required_fields ~w(manufacturer color model)
  @optional_fields ~w(year description)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
