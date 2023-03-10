defmodule Servy.Bear do

  defstruct id: nil, name: "", type: "", hibernate: false

  def is_grizzly(bear) do
    bear.type == "Grizzly"
  end

  def sort_asc_by_name(bear1, bear2) do
    bear1.name <= bear2.name
  end

end
