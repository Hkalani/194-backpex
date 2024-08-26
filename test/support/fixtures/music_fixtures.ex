defmodule Teacher.MusicFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Teacher.Music` context.
  """

  @doc """
  Generate a album.
  """
  def album_fixture(attrs \\ %{}) do
    {:ok, album} =
      attrs
      |> Enum.into(%{
        artist: "some artist",
        description: "some description",
        title: "some title",
        year: "some year"
      })
      |> Teacher.Music.create_album()

    album
  end
end
