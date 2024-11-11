defmodule TeacherWeb.PostLive.Index do
  use TeacherWeb, :live_view

  alias Teacher.Blog

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:page_title, "Listing Posts")
      |> assign(:Posts, Blog.list_blog_posts())
    {:ok, socket}
  end

end
