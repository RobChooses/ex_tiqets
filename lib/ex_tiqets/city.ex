defmodule ExTiqets.City do
  @moduledoc """
  Elixir wrapper for the Tiqets API - Cities
  """

  @doc """
  Get a single city

  ## Example - The Netherlands (id: 50166)

      iex> ExTiqets.City.get(client, 50166)
      {:ok, response}

  """
  def get(client, id) do
    params = [id: id]
    Tesla.get(client, "/cities/:id", opts: [path_params: params])
  end

  @doc """
  Get cities

  ## Example - get all cities in UK (country_id: 50076)

      iex> ExTiqets.City.get_all(client)
      {:ok, response}

      iex> options = %{
             page_size: 20,
             page: 1,
             country_id: 50076
           }

      iex> ExTiqets.City.get_all(client, options)
      {:ok, response}

  """
  def get_all(client) do
    Tesla.get(client, "/cities")
  end

  def get_all(client, options) do
    Tesla.get(client, "/cities", query: Map.to_list(options))
  end
end
