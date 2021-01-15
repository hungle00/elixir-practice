defmodule MultiDict do
  def new(), do: %{}

  def add(dict, date, title) do
    Map.update(dict, date, [title], fn titles -> [title | titles] end)
  end

  def get(dict, date) do
    Map.get(dict, date, [])
  end
end

defmodule SimpleTodo do
  def new(), do: MultiDict.new()

  def add_entry(todo_list, entry) do
    MultiDict.add(todo_list, entry.date, entry)
  end

  def entries(todo_list, date) do
    MultiDict.get(todo_list, date)
  end
end
