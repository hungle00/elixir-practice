defmodule Todo.List do
  defstruct auto_id: 1, entries: %{}

  def new(entries \\ []) do

  end
  def size(todo_list) do
    Map.size(todo_list.entries)
  end

  def add_entry(todo_list, entry) do

  end
end
