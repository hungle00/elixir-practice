defmodule Todo.List do
  defstruct auto_id: 1, entries: %{}

  def new(entries \\ []) do
    Enum.reduce(
      entries, %Todo.List{},
      fn entry, todo_acc -> add_entry(todo_acc, entry) end
    )
  end

  def size(todo_list) do
    map_size(todo_list.entries)
  end

  def add_entry(todo_list, entry) do
    entry = Map.put(entry, :id, todo_list.auto_id)
    new_entries = Map.put(todo_list.entries, todo_list.auto_id, entry)
    %Todo.List{todo_list |
      entries: new_entries,
      auto_id: todo_list.auto_id + 1
    }
  end

  def entries(todo_list, date) do
    todo_list.entries
    |> Stream.filter(fn {_, entry} -> entry.date == date end)
    |> Enum.map(fn {_, entry} -> entry end)
  end
end
