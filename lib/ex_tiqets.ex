defmodule ExTiqets do
  @moduledoc """
  Elixir wrapper for the Tiqets API
  """

  @doc """
  Create a client to be used with each HTTP function (`get`, `post`, etc.) using default settings
  from `config.exs` or dynamically in runtime

  ## Examples
      iex> client = ExTiqets.client
      %Tesla.Client{ .. }

      iex> client = ExTiqets.client(%{api_key: "123456abcdef", language: "ru", currency: "GBP"})
      %Tesla.Client{ .. }

  Returns
  %Tesla.Client{}

  """
  def client(options \\ []) do
    defaults = %{
      base_url: Application.get_env(:ex_tiqets, :tiqets_base_url),
      api_key: Application.get_env(:ex_tiqets, :tiqets_api_key),
      language: Application.get_env(:ex_tiqets, :tiqets_language),
      currency: Application.get_env(:ex_tiqets, :tiqets_currency)
    }

    # Pattern match to extract values from options or use default configs
    %{
      base_url: base_url,
      api_key: api_key,
      language: language,
      currency: currency
    } = Enum.into(options, defaults)

    middleware = [
      {Tesla.Middleware.BaseUrl, base_url},
      Tesla.Middleware.JSON,
      {Tesla.Middleware.Query, [lang: language, currency: currency]},
      {Tesla.Middleware.Headers, [{"Authorization", "Token: #{api_key}"}]},
      Tesla.Middleware.PathParams
    ]

    Tesla.client(middleware)
  end
end
