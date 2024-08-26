defmodule TeacherWeb.AlbumLive.Index do
  use TeacherWeb, :live_view

  alias Teacher.Music

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:page_title, "Listing Albums")
      |> assign(:albums, Music.list_albums())
    {:ok, socket}
  end

end
