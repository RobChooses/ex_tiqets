defmodule ExTiqets.Product do
  @moduledoc """
  Elixir wrapper for the Tiqets API - Products
  """

  @doc """
  Get a single product by product_id

  ## Example
  iex> ExTiqets.Product.get(client, "123456")
  {:ok, response}

  """
  def get(client, id) do
    params = [id: id]
    Tesla.get(client, "/products/:id", opts: [path_params: params])
  end

  @doc """
  Get all products (paged)

  ## Example
  iex> ExTiqets.Product.get_all(client)
  {:ok, response}

  """
  def get_all(client) do
    Tesla.get(client, "/products")
  end

  @doc """
  Get products matching search filter

  ## Example - get products in NYC, search for Kids (400) sort by descending popularity, 20 products per page
  iex> options = %{
    page_size: 20,
    city_id: 260932,
    tag_id: 400,
    sort: popularity desc
  }
  iex> ExTiqets.Product.get_by_search_filter(client, options)
  {:ok, response}

  """
  def get_by_search_filter(client, options) do
    Tesla.get(client, "/products", query: Map.to_list(options))
  end

  @doc """
  Retrieves the most frequently purchased products by the API user, ordered by number of orders.
  The last 3 months of orders will be taken into account.

  ## Example
  iex> ExTiqets.Product.get_frequenty_purchased(client)
  {:ok, response}

  """
  def get_frequenty_purchased(client) do
    Tesla.get(client, "/products/frequently_purchased")
  end

end
