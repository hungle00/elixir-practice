# Wanderer
An asynchronous web crawling implementations in Elixir

### Installation
```bash
# Install dependencies
mix deps.get
```

### Dependencies
- `httpoison` - HTTP client for making requests
- `floki` - HTML parser for extracting links

### Usage

#### Basic Usage
```elixir
# Start IEx with the project
iex -S mix

# Crawl a single URL
Wanderer.crawl("https://example.com")

# Crawl multiple URLs concurrently
urls = ["https://example.com", "https://github.com"]
Wanderer.crawl_async(urls)

# Use Task.async_stream with concurrency limit
Wanderer.crawl_with_async_stream(urls, 5)
```

### Features
- ✅ Concurrent crawling with `Task.async`
- ✅ Concurrency control with `Task.async_stream`
- ✅ Error handling and isolation


