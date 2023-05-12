defmodule Metex.Worker do

  def loop do
    receive do
      {sender_pid, location} ->
        send(sender_pid,  {:ok, temperature_of(location)})
      _ ->
        IO.puts "don't know how to process this message"
    end
    loop()
  end
  def temperature_of(location) do
    result =  url_for(location) |> HTTPoison.get |> parse_response
    case result do
      {:ok, temp} -> "#{location}: #{temp}°C"
      :error -> "#{location} not found"
    end
  end

  defp parse_response({:ok, %HTTPoison.Response{body: body, status_code: 200}}) do
    body |> JSON.decode! |> compute_temperature
  end

  defp parse_response(_), do: :error

  defp compute_temperature(json) do
    try do
      temp = (json["main"]["temp"] - 273.15) |> Float.round(1)
      {:ok, temp}
    rescue
      _ -> :error
    end
  end

  defp url_for(location) do
    location = URI.encode(location)
    "http://api.openweathermap.org/data/2.5/weather?q=#{location}&appid=#{apikey()}"
  end

  defp apikey, do: "f1595987fdf3662cef3966a438a74e57"
end


# cities = ["Singapore", "Monaco", "Vatican City", "Hong Kong", "Macau"]

# cities |> Enum.each(fn city ->
#   pid = spawn(Metex.Worker, :loop, [])
#   send(pid, {self, city})
# end)
