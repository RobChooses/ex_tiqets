defmodule ExTiqets.Tag do
  @moduledoc """
  Elixir wrapper for the Tiqets API - Tags
  """

  @doc """
  Get tag types, such as:
    "category", "recommended audience", "best time of day", "main category"

  ## Example
  iex> ExTiqets.Tag.get_types(client)
  {:ok, response}

  """
  def get_types(client) do
    Tesla.get(client, "/tag_types")
  end

  @doc """
  Get a tag by id

  ## Example to retrieve Kids (400) tag type
  iex> ExTiqets.Tag.get(client, 400)
  {:ok, response}

  """
  def get(client, id) do
    params = [id: id]
    Tesla.get(client, "/tags/:id", opts: [path_params: params])
  end

  @doc """
  Get all tags

  ## Examples
  iex> ExTiqets.Tag.get_all(client)
  {:ok, response}

  iex> options = %{
    page_size: 20,
    page: 1,
    type_name: "category""
  }
  iex> ExTiqets.Tag.get_all(client, options)
  {:ok, response}

  """
  def get_all(client) do
    Tesla.get(client, "/tags")
  end

  def get_all(client, options) do
    Tesla.get(client, "/tags", query: Map.to_list(options))
  end
end
