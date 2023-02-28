defmodule Servy.Handler do

  @moduledoc """
  Handles HTTP requests
  """

  alias Servy.Conv
  alias Servy.BearController

  @pages Path.expand("../../pages", __DIR__)

  import Servy.Plugins, only: [rewrite_path: 1, log: 1, track: 1, emojify: 1]
  import Servy.Parser, only: [parse: 1]
  # alias Servy.Plugins
  # alias Servy.Parser
  #import Servy.FileHandler, only: [parse_file_content: 2]

  @doc "Transform the request into a response."
  def handle(request) do
    request
    |> parse
    |> rewrite_path
    |> log
    |> route
    |> track
    |> emojify
    |> format_response
  end

  # def parse_file_content({:ok, content}, conv) do
  #   %{ conv | status: 200, resp_body: content }
  # end

  # def parse_file_content({:error, :enoent}, conv) do
  #   %{ conv | status: 404, resp_body: "File not found!" }
  # end

  # def parse_file_content({:error, reason}, conv) do
  #   %{ conv | status: 500, resp_body: "File error:  #{reason}" }
  # end

  # def route(%Conv{ method: "GET", path: "/wildthings"} = conv) do
  #   %{ conv | status: 200, resp_body:  "Bears, Lions, Giraffes"}
  # end

  def route(%Conv{ method: "GET", path: "/bears"} = conv) do
    BearController.index(conv)
  end

  # def route(%Conv{ method: "GET", path: "/bears/new"} = conv) do
  #     @pages
  #     |> Path.join("form.html")
  #     |> File.read
  #     |> parse_file_content(conv)
  # end

  # name=Baloo&type=Brown
  def route(%Conv{ method: "POST", path: "/bears"} = conv) do
    BearController.create(conv, conv.params)
  end

  def route(%Conv{ method: "GET", path: "/bears/" <> id} = conv) do
    params = Map.put(conv.params, "id", id)
    BearController.show(conv, params)
  end

  def route(%Conv{ method: "DELETE", path: "/bears/" <> _id } = conv) do
    BearController.delete(conv, conv.params)
  end

  def route(%Conv{ method: "GET", path: "/" <> page} = conv) do
    file =
      @pages
      |> Path.join("#{page}.html")
    case File.read(file) do
      {:ok, content} -> %{ conv | status: 200, resp_body: content }
      {:error, :enoent} -> %{ conv | status: 404, resp_body: "File not found!" }
      {:error, reason} -> %{ conv | status: 500, resp_body: "File error: #{reason}" }
    end
  end

  def route(%Conv{ path: path} = conv) do
    %{ conv | status: 404, resp_body: "No #{path} here!"}
  end

  def format_response(%Conv{} = conv) do
    """
    HTTP/1.1 #{Conv.full_status(conv)}
    Content-Type: text/html
    Content-Length: #{byte_size(conv.resp_body)}

    #{conv.resp_body}
    """
  end

end
