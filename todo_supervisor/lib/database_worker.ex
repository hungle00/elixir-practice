defmodule Todo.DatabaseWorker do
  use GenServer

  def start_link(db_folder) do
    IO.puts("Starting database worker.")
    GenServer.start_link(__MODULE__, db_folder)
  end

  def store(worker_pid, key, value) do
    GenServer.cast(worker_pid, {:store, key, value})
  end

  def get(worker_pid, key) do
    GenServer.call(worker_pid, {:get, key})
  end

  def init(db_folder) do
    {:ok, db_folder}
  end

  def handle_cast({:store, key, value}, db_folder) do
    db_folder
    |> file_name(key)
    |> File.write!(:erlang.term_to_binary(value))

    {:noreply, db_folder}
  end

  def handle_call({:get, key}, _, db_folder) do
    value = case File.read(file_name(db_folder, key)) do
      {:ok, contents} -> :erlang.binary_to_term(contents)
      _ -> nil
    end
    {:reply, value, db_folder}
  end

  defp file_name(db_folder, key) do
    Path.join(db_folder, to_string(key))
  end
end
