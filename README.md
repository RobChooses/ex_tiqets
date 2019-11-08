# ExTiqets

Elixir wrapper for the [Tiqets V2 API](https://api.tiqets.com/v2/docs/#api-overview)

## Usage

Create a client to make HTTP calls (based on Tesla HTTP Client)
```elixir
iex> client = ExTiqets.client(%{api_key: TIQETS_API_KEY})
# => %Tesla.Client{}
```

Retrieve activities in NYC for Kids (id: 400)
```elixir
iex> options = {
  city_id: 260932,
  tag_id: 400,
  page_size: 20
}
iex> ExTiqets.Product.get_by_search_filter(client, options)
{:ok, response}

response.body # => 200
response.status # => %{"pagination" => ..., "products" => [ ... ], ...}
response.headers # => [{"content-type", "application/json" ...}]
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_tiqets` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_tiqets, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/ex_tiqets](https://hexdocs.pm/ex_tiqets).

