defmodule TodoCacheTest do
  use ExUnit.Case

  test "server_process" do
    {:ok, cache} = Todo.Cache.start()
    a_pid = Todo.Cache.server_process(cache, "a")

    assert a_pid == Todo.Cache.server_process(cache, "a")
    assert a_pid != Todo.Cache.server_process(cache, "b")
  end

  test "todo list" do
    {:ok, cache} = Todo.Cache.start()
    steve = Todo.Cache.server_process(cache, "steve")
    Todo.Server.add_entry(steve, %{date: ~D[2018-12-19], title: "Dentist"})
    entries = Todo.Server.entries(steve, ~D[2018-12-19])

    assert [%{date: ~D[2018-12-19], title: "Dentist"}] = entries
  end
end
