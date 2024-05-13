defmodule WaveWeb.Schema.User.Mutations do

  @moduledoc """
  Mutations for user
  """

  use Absinthe.Schema.Notation
  alias WaveWeb.Resolvers.User

  object :user_mutations do
    field :create_user, :user do
      arg(:first_name, :string)
      arg(:last_name, :string)
      resolve(&User.create_user/2)
    end
  end
end
