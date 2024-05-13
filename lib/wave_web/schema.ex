defmodule WaveWeb.Schema do
  @moduledoc """
  GraphQL schema for wave.
  """

  use Absinthe.Schema

  import_types(Absinthe.Plug.Types)
  import_types(Absinthe.Type.Custom)
  import_types(WaveWeb.Schema.Types)

  query do
    import_fields(:user_queries)
  end

  mutation do
    import_fields(:user_mutations)
  end
end
