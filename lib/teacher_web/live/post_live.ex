defmodule TeacherWeb.Live.PostLive do
  use Backpex.LiveResource,
    adapter: Backpex.Adapters.Ecto,
    adapter_config: [
      schema: Teacher.Blog.Post,
      repo: Teacher.Repo,
      update_changeset: &Teacher.Blog.Post.changeset/3,
      create_changeset: &Teacher.Blog.Post.changeset/3,
      item_query: &__MODULE__.item_query/3
    ],
    layout: {TeacherWeb.Layouts, :admin},
    pubsub: [
      name: Teacher.PubSub,
      topic: "posts",
      event_prefix: "post_"
    ]

  @impl Backpex.LiveResource
  def singular_name, do: "Post"

  @impl Backpex.LiveResource
  def plural_name, do: "Posts"

  @impl Backpex.LiveResource
  def fields do
    [
      title: %{
        module: Backpex.Fields.Text,
        label: "Title"
      },
      views: %{
        module: Backpex.Fields.Number,
        label: "Views"
      }
    ]
  end
end
