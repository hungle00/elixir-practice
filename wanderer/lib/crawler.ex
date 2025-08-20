defmodule Crawler do
  @spec crawl(binary()) :: {:error, <<_::64, _::_*8>> | HTTPoison.Error.t()} | {:ok, list()}
  def crawl(url) do
    with {:ok, body} <- fetch_url(url),
         {:ok, links} <- parse_links(body) do
      {:ok, links}
    else
      {:error, reason} -> {:error, reason}
    end
  end

  defp parse_links(html) do
    case Floki.parse_document(html) do
      {:ok, document} ->
        links = document |> Floki.find("a") |> Floki.attribute("href")
        {:ok, links}
      {:error, reason} ->
        {:error, "Parsing error: #{reason}"}
    end
  end

  defp fetch_url(url) do
    case HTTPoison.get(url) do
      {:ok, %{body: body}} -> {:ok, body}
      {:error, reason} -> {:error, reason}
    end
  end
end
