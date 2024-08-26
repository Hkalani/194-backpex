defmodule TeacherWeb.AlbumLive.FormComponent do
  use TeacherWeb, :live_component

  alias Teacher.Music

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage album records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="album-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:artist]} type="text" label="Artist" />
        <.input field={@form[:title]} type="text" label="Title" />
        <.input field={@form[:year]} type="text" label="Year" />
        <.input field={@form[:description]} type="text" label="Description" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Album</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{album: album} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Music.change_album(album))
     end)}
  end

  @impl true
  def handle_event("validate", %{"album" => album_params}, socket) do
    changeset = Music.change_album(socket.assigns.album, album_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"album" => album_params}, socket) do
    save_album(socket, socket.assigns.action, album_params)
  end

  defp save_album(socket, :edit, album_params) do
    case Music.update_album(socket.assigns.album, album_params) do
      {:ok, album} ->
        notify_parent({:saved, album})

        {:noreply,
         socket
         |> put_flash(:info, "Album updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_album(socket, :new, album_params) do
    case Music.create_album(album_params) do
      {:ok, album} ->
        notify_parent({:saved, album})

        {:noreply,
         socket
         |> put_flash(:info, "Album created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
