defmodule Teacher.Music.Album do
  use Ecto.Schema
  import Ecto.Changeset

  schema "albums" do
    field :artist, :string
    field :description, :string
    field :title, :string
    field :year, :integer

    timestamps(type: :utc_datetime)
  end

  def changeset(album, attrs, _metadata) do
    changeset(album, attrs)
  end

  @doc false
  def changeset(album, attrs) do
    album
    |> cast(attrs, [:artist, :title, :year, :description])
    |> validate_required([:artist, :title, :year, :description])
  end
end
