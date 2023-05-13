defmodule TodoPlugTest do
  use ExUnit.Case
  doctest TodoPlug

  test "greets the world" do
    assert TodoPlug.hello() == :world
  end
end
