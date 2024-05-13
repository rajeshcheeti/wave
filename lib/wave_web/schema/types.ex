defmodule WaveWeb.Schema.Types do
  @moduledoc """
  Types for Wave GraphQL schema.
  """

  use Absinthe.Schema.Notation
  import_types(WaveWeb.Schema.User.Types)
end
