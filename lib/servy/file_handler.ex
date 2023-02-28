# defmodule Servy.FileHandler do
#   @moduledoc """
#   File related operations, mainly reading files and parsing file content
#   """

#   def parse_file_content({:ok, content}, conv) do
#     %{ conv | status: 200, resp_body: content }
#   end

#   def parse_file_content({:error, :enoent}, conv) do
#     %{ conv | status: 404, resp_body: "File not found!" }
#   end

#   def parse_file_content({:error, reason}, conv) do
#     %{ conv | status: 500, resp_body: "File error:  #{reason}" }
#   end

# end
