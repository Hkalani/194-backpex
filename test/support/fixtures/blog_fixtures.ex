defmodule Teacher.BlogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Teacher.Blog` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        title: "some title",
        views: 42
      })
      |> Teacher.Blog.create_post()

    post
  end
end
