defmodule Servy.Parser do
  @moduledoc """
  Parses the request and outputs Map containing path, and empty resp_body and status
  """
  alias Servy.Conv

  def parse(request) do
    [top, params_string] = String.split(request, "\n\n")

    [request_line | headers_line] = String.split(top, "\n")
    [method, path, _] = String.split(request_line, " ")
    headers = parse_headers(headers_line)
    params = parse_params(headers["Content-Type"], params_string)

    IO.inspect params

    %Conv
    { method: method,
      path: path,
      params: params,
      headers: headers
    }
  end

  def parse_params("application/x-www-form-urlencoded", params_string) do
    params_string |> String.trim |> URI.decode_query
  end

  def parse_params(_, _), do: %{}

  # def parse_headers([head | tail], headers) do
  #   [key, value] = String.split(head, ": ")
  #   headers = Map.put(headers, key, value)
  #   parse_headers(tail, headers)
  # end

  # def parse_headers([], headers), do: headers

  def parse_headers(headers) do
    Enum.reduce(headers, %{}, fn(header, acc) ->
      [key, value] = String.split(header, ": ")
      Map.put(acc, key, value)
    end)
  end

end
