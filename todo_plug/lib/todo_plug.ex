defmodule TodoPlug do
  @moduledoc """
  Documentation for `TodoPlug`.
  """
  use Plug.Router
  require Logger
  alias Todo.TodoServer

  plug :match
  plug :dispatch

  get "/todos" do
    todos = TodoServer.all_notes()
    Logger.info(todos)
    
    send_resp(conn, 200, formatted_todos(todos))
  end

  get "/todos/new" do
    conn = fetch_query_params(conn)
    note = Map.fetch!(conn.params, "note")
    Logger.info(note)
    TodoServer.all_notes() |> TodoServer.create_note(%{note: note, id: nil}) 
    
    updated_todos = TodoServer.all_notes()
    send_resp(conn, 200, formatted_todos(updated_todos))
  end

  get "/todos/:id" do
    conn = fetch_query_params(conn)
    id = Map.fetch!(conn.params, "id") |> String.to_integer
    todo = TodoServer.all_notes() |> TodoServer.get_note(id)
    Logger.info(todo)
    send_resp(conn, 200, formatted_todos(todo))
  end

  get "/todos/:id/delete" do
    conn = fetch_query_params(conn)
    id = Map.fetch!(conn.params, "id") |> String.to_integer
    TodoServer.all_notes() |> TodoServer.delete_note(id)

    todos = TodoServer.all_notes()
    send_resp(conn, 200, formatted_todos(todos))
  end

  match _ do
    send_resp(conn, 404, "not found")
  end

  defp formatted_todos(todos) do
    Jason.encode!(todos)
  end
end
