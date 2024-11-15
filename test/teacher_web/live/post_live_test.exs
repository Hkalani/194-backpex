defmodule TeacherWeb.PostLiveTest do
  use TeacherWeb.ConnCase

  import Phoenix.LiveViewTest
  import Teacher.BlogFixtures

  @create_attrs %{title: "some title", views: 42}
  @update_attrs %{title: "some updated title", views: 43}
  @invalid_attrs %{title: nil, views: nil}

  defp create_post(_) do
    post = post_fixture()
    %{post: post}
  end

  describe "Index" do
    setup [:create_post]

    test "lists all blog_posts", %{conn: conn, post: post} do
      {:ok, _index_live, html} = live(conn, ~p"/blog_posts")

      assert html =~ "Listing Blog posts"
      assert html =~ post.title
    end

    test "saves new post", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/blog_posts")

      assert index_live |> element("a", "New Post") |> render_click() =~
               "New Post"

      assert_patch(index_live, ~p"/blog_posts/new")

      assert index_live
             |> form("#post-form", post: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#post-form", post: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/blog_posts")

      html = render(index_live)
      assert html =~ "Post created successfully"
      assert html =~ "some title"
    end

    test "updates post in listing", %{conn: conn, post: post} do
      {:ok, index_live, _html} = live(conn, ~p"/blog_posts")

      assert index_live |> element("#blog_posts-#{post.id} a", "Edit") |> render_click() =~
               "Edit Post"

      assert_patch(index_live, ~p"/blog_posts/#{post}/edit")

      assert index_live
             |> form("#post-form", post: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#post-form", post: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/blog_posts")

      html = render(index_live)
      assert html =~ "Post updated successfully"
      assert html =~ "some updated title"
    end

    test "deletes post in listing", %{conn: conn, post: post} do
      {:ok, index_live, _html} = live(conn, ~p"/blog_posts")

      assert index_live |> element("#blog_posts-#{post.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#blog_posts-#{post.id}")
    end
  end

  describe "Show" do
    setup [:create_post]

    test "displays post", %{conn: conn, post: post} do
      {:ok, _show_live, html} = live(conn, ~p"/blog_posts/#{post}")

      assert html =~ "Show Post"
      assert html =~ post.title
    end

    test "updates post within modal", %{conn: conn, post: post} do
      {:ok, show_live, _html} = live(conn, ~p"/blog_posts/#{post}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Post"

      assert_patch(show_live, ~p"/blog_posts/#{post}/show/edit")

      assert show_live
             |> form("#post-form", post: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#post-form", post: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/blog_posts/#{post}")

      html = render(show_live)
      assert html =~ "Post updated successfully"
      assert html =~ "some updated title"
    end
  end
end
