defmodule TeacherWeb.Live.AlbumLive do
  use Backpex.LiveResource,
    adapter: Backpex.Adapters.Ecto,
    adapter_config: [
      schema: Teacher.Music.Album,
      repo: Teacher.Repo,
      update_changeset: &Teacher.Music.Album.changeset/3,
      create_changeset: &Teacher.Music.Album.changeset/3
    ],
    layout: {TeacherWeb.Layouts, :admin},
    pubsub: [
      name: Teacher.PubSub,
      topic: "albums",
      event_prefix: "album_"
    ]

  @impl Backpex.LiveResource
  def singular_name, do: "Album"

  @impl Backpex.LiveResource
  def plural_name, do: "Albums"

  @impl Backpex.LiveResource
  def fields do
    [
      artist: %{
        module: Backpex.Fields.Text,
        label: "Artist"
      },
      title: %{
        module: Backpex.Fields.Text,
        label: "Title"
      },
      year: %{
        module: TeacherWeb.Fields.Year,
        label: "Year"
      },
      description: %{
        module: Backpex.Fields.Textarea,
        label: "Description"
      }
    ]
  end

  @impl Backpex.LiveResource
  def filters do
    [
      year: %{
        module: TeacherWeb.Filters.AlbumYearRange
      }
    ]
  end
end
