defmodule TodoListTest do
  use ExUnit.Case

  test "empty todo list" do
    assert Todo.List.size(Todo.List.new()) == 0
  end
end
