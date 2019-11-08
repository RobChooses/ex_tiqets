defmodule ExTiqetsTest do
  use ExUnit.Case
  doctest ExTiqets

  test "new tiqets client" do
    assert %Tesla.Client{} = ExTiqets.client
  end
end
