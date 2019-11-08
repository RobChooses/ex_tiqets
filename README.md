# ExTiqets

Elixir wrapper for the [Tiqets V2 API](https://api.tiqets.com/v2/docs/#api-overview)

Documentation can be found at [https://hexdocs.pm/ex_tiqets](https://hexdocs.pm/ex_tiqets/api-reference.html).

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

response.status # => 200
response.body # => %{"pagination" => ..., "products" => [ ... ], ...}
response.headers # => [{"content-type", "application/json" ...}]
```

## Configuration

The Tiqets `API_KEY`, default language and currency can be set in the `config.exs` file.

## Installation

The package is available in Hex and can be installed by adding `ex_tiqets` to your
list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_tiqets, "~> 0.1.0"}
  ]
end
```
