defmodule ToyRobotTest do
  use ExUnit.Case
  doctest ToyRobot

  test "greets the world" do
    assert ToyRobot.hello() == :world
  end
end
