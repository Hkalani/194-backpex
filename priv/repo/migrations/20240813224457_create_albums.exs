defmodule Teacher.Repo.Migrations.CreateAlbums do
  use Ecto.Migration

  def change do
    create table(:albums) do
      add :artist, :string
      add :title, :string
      add :year, :integer
      add :description, :string

      timestamps(type: :utc_datetime)
    end
  end
end
