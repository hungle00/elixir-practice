# Elixir Showcase

### 1. Todo Plug
A simple HTTP API built with Plug for managing todo items with CRUD operations.

#### Usage
```bash
# Start the server
mix run --no-halt

# API Endpoints:
# GET /todos - List all todos
# GET /todos/new?note=your_note - Create a new todo
# GET /todos/:id - Get a specific todo by ID
# GET /todos/:id/delete - Delete a todo by ID
```

#### Features
- ✅ RESTful API endpoints
- ✅ JSON response format
- ✅ CRUD operations for todo items
- ✅ Built with Plug framework

### 2. Metex
A concurrent weather application that fetches temperatures for multiple cities using worker processes and coordinator pattern.

#### Usage
```elixir
# Start IEx with the project
iex -S mix

# Fetch temperatures for multiple cities concurrently
cities = ["Singapore", "Monaco", "Vatican City", "Hong Kong", "Macau"]
Metex.temperatures_of(cities)

# Using Worker2 with GenServer
{:ok, pid} = Metex.Worker2.start_link
Metex.Worker2.get_temperature(pid, "Hanoi")
```

#### Features
- ✅ Concurrent temperature fetching
- ✅ Worker-Coordinator pattern
- ✅ Multiple worker implementations (spawn vs GenServer)
- ✅ HTTP API integration for weather data

### 3. Wanderer
An asynchronous web crawling implementations in Elixir  

#### Usage
```elixir
# Start IEx with the project
iex -S mix

# Crawl a single URL
Wanderer.crawl("https://example.com")

# Crawl multiple URLs concurrently
urls = ["https://example.com", "https://github.com"]
Wanderer.crawl_async(urls)

# Use Task.async_stream with concurrency limit
Wanderer.crawl_async_stream(urls, 5)
```

#### Features
- ✅ Concurrent crawling with `Task.async`
- ✅ Concurrency control with `Task.async_stream`
- ✅ Error handling and isolation

