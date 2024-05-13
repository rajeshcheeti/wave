defmodule WaveWeb.Schema.User.Queries do
  @moduledoc """
  User queries for GraphQL schema
  """

  use Absinthe.Schema.Notation
  alias WaveWeb.Resolvers.User

  object :user_queries do
    @desc "Get user"
    field :user, :user do
      arg(:uid, non_null(:uuid))
      resolve(&User.get_user/2)
    end
  end
end
