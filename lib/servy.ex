defmodule Servy.SampleRequest do
  # request = """
  # GET /wildthings HTTP/1.1
  # Host: example.com
  # User-Agent: ExampleBrowser/1.0
  # Accept: */*

  # """

  # response = Servy.Handler.handle(request)
  # IO.puts(response)

  request = """
  GET /bears HTTP/1.1
  Host: example.com
  User-Agent: ExampleBrowser/1.0
  Accept: */*

  """

  response = Servy.Handler.handle(request)
  IO.puts(response)


  # request = """
  # GET /bigfoot HTTP/1.1
  # Host: example.com
  # User-Agent: ExampleBrowser/1.0
  # Accept: */*

  # """

  # response = Servy.Handler.handle(request)
  # IO.puts(response)

  request = """
  GET /bears/1 HTTP/1.1
  Host: example.com
  User-Agent: ExampleBrowser/1.0
  Accept: */*

  """

  response = Servy.Handler.handle(request)
  IO.puts(response)

  request = """
  DELETE /bears/1 HTTP/1.1
  Host: example.com
  User-Agent: ExampleBrowser/1.0
  Accept: */*

  """

  response = Servy.Handler.handle(request)
  IO.puts(response)


  # request = """
  # GET /wildlife HTTP/1.1
  # Host: example.com
  # User-Agent: ExampleBrowser/1.0
  # Accept: */*

  # """

  # response = Servy.Handler.handle(request)
  # IO.puts(response)


  request = """
  GET /bears?id=2 HTTP/1.1
  Host: example.com
  User-Agent: ExampleBrowser/1.0
  Accept: */*

  """

  response = Servy.Handler.handle(request)
  IO.puts(response)

  # request = """
  # GET /about HTTP/1.1
  # Host: example.com
  # User-Agent: ExampleBrowser/1.0
  # Accept: */*

  # """

  # response = Servy.Handler.handle(request)
  # IO.puts(response)

  # request = """
  # GET /bears/new HTTP/1.1
  # Host: example.com
  # User-Agent: ExampleBrowser/1.0
  # Accept: */*

  # """

  # response = Servy.Handler.handle(request)
  # IO.puts(response)

  # request = """
  # GET /faq HTTP/1.1
  # Host: example.com
  # User-Agent: ExampleBrowser/1.0
  # Accept: */*

  # """

  # response = Servy.Handler.handle(request)
  # IO.puts(response)

  request = """
  POST /bears HTTP/1.1
  Host: example.com
  User-Agent: ExampleBrowser/1.0
  Accept: */*
  Content-Type: application/x-www-form-urlencoded
  Content-Length: 21

  name=Baloo&type=Brown
  """

  response = Servy.Handler.handle(request)
  IO.puts(response)

end
