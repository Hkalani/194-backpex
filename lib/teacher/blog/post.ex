defmodule Teacher.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "blog_posts" do
    field :title, :string
    field :views, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false

  def changeset(post, attrs, _metadata) do
    changeset(post, attrs)
  end

  def changeset(post, attrs) do
    post
      |> cast(attrs, [:title, :views])
      |> validate_required([:title])
      |> validate_length(:title, min: 3, max: 100)
      |> validate_number(:views, greater_than_or_equal_to: 0)
  end
end
