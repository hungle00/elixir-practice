defmodule Wanderer do
  @timeout 30_000

  @spec crawl_async(any()) :: list()
  def crawl_async(urls, timeout \\ @timeout)  do
    urls
    |> Enum.map(fn url -> Task.async(fn -> Crawler.crawl(url) end) end)
    |> Enum.map(fn t ->
      case Task.await(t, timeout) do
        {:ok, links} -> links
        {:error, reason} -> {:error, reason}
      end
    end)
  end

  @spec crawl_async_stream(any(), integer()) :: list()
  def crawl_async_stream(urls, max_concurrent \\ 5, timeout \\ @timeout) do
    urls
    |> Task.async_stream(fn url -> Crawler.crawl(url) end,
      max_concurrency: max_concurrent,
      timeout: timeout
    )
    |> Enum.map(fn
      {:ok, result} -> result
      {:exit, reason} -> {:error, reason}
    end)
  end
end
