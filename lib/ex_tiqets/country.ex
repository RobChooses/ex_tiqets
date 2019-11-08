defmodule ExTiqets.Country do
  @moduledoc """
  Elixir wrapper for the Tiqets API - Countries
  """

  @doc """
  Get a single country

  ## Example - The Netherlands (id: 50166)

      iex> ExTiqets.Country.get(client, 50166)
      {:ok, response}

  """
  def get(client, id) do
    params = [id: id]
    Tesla.get(client, "/countries/:id", opts: [path_params: params])
  end

  @doc """
  Get multiple countries

  ## Examples

      iex> ExTiqets.Country.get_all(client)
      {:ok, response}

      iex> options = %{
             page_size: 20,
             page: 1
           }

      iex> ExTiqets.Country.get_all(client, options)
      {:ok, response}

  """
  def get_all(client) do
    Tesla.get(client, "/countries")
  end

  def get_all(client, options) do
    Tesla.get(client, "/countries", query: Map.to_list(options))
  end
end
