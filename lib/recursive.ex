defmodule Recursion do

    def my_map([head | tail], multiplier) do
        [ head * multiplier | my_map(tail, multiplier)]
    end

    def my_map([], _), do: []

end
