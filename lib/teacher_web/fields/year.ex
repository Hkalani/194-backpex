defmodule TeacherWeb.Fields.Year do
  use BackpexWeb, :field

  @impl Backpex.Field
  def render_value(assigns) do
    ~H"""
    <p>
      <%= HTML.pretty_value(@value) %>
    </p>
    """
  end

  @impl Backpex.Field
  def render_form(assigns) do
    Backpex.Fields.Number.render_form(assigns)
  end
end
