defmodule Teacher.MusicTest do
  use Teacher.DataCase

  alias Teacher.Music

  describe "albums" do
    alias Teacher.Music.Album

    import Teacher.MusicFixtures

    @invalid_attrs %{artist: nil, description: nil, title: nil, year: nil}

    test "list_albums/0 returns all albums" do
      album = album_fixture()
      assert Music.list_albums() == [album]
    end

    test "get_album!/1 returns the album with given id" do
      album = album_fixture()
      assert Music.get_album!(album.id) == album
    end

    test "create_album/1 with valid data creates a album" do
      valid_attrs = %{artist: "some artist", description: "some description", title: "some title", year: "some year"}

      assert {:ok, %Album{} = album} = Music.create_album(valid_attrs)
      assert album.artist == "some artist"
      assert album.description == "some description"
      assert album.title == "some title"
      assert album.year == "some year"
    end

    test "create_album/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Music.create_album(@invalid_attrs)
    end

    test "update_album/2 with valid data updates the album" do
      album = album_fixture()
      update_attrs = %{artist: "some updated artist", description: "some updated description", title: "some updated title", year: "some updated year"}

      assert {:ok, %Album{} = album} = Music.update_album(album, update_attrs)
      assert album.artist == "some updated artist"
      assert album.description == "some updated description"
      assert album.title == "some updated title"
      assert album.year == "some updated year"
    end

    test "update_album/2 with invalid data returns error changeset" do
      album = album_fixture()
      assert {:error, %Ecto.Changeset{}} = Music.update_album(album, @invalid_attrs)
      assert album == Music.get_album!(album.id)
    end

    test "delete_album/1 deletes the album" do
      album = album_fixture()
      assert {:ok, %Album{}} = Music.delete_album(album)
      assert_raise Ecto.NoResultsError, fn -> Music.get_album!(album.id) end
    end

    test "change_album/1 returns a album changeset" do
      album = album_fixture()
      assert %Ecto.Changeset{} = Music.change_album(album)
    end
  end
end
