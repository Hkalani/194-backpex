defmodule TeacherWeb.Filters.AlbumYearRange do
  use Backpex.Filters.Range

  @impl Backpex.Filters.Range
  def type, do: :number

  @impl Backpex.Filter
  def label, do: "Year range"
end
