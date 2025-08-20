defmodule WandererTest do
  use ExUnit.Case
  doctest Wanderer

  test "greets the world" do
    assert Wanderer.hello() == :world
  end
end
