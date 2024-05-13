defmodule WaveWeb.Schema.User.Types do
  @moduledoc """
  Types for User GraphQL schema.
  """

  use Absinthe.Schema.Notation
  alias Utils.ValidateUUID
  alias WaveWeb.Schema.User.Queries
  alias WaveWeb.Schema.User.Mutations

  #####################################
  # QUERIES
  #####################################
  import_types(Queries)
  import_types(Mutations)

  #####################################
  # OBJECTS
  #####################################

  @desc "Type of user"
  object :user do
    field :uid, :uuid
    field :first_name, :string
    field :last_name, :string
  end

  @desc "Validate that uuid is in correct format"

  scalar :uuid, name: "Uuid" do
    serialize(&serialize_uuid/1)
    parse(&parse_uuid/1)
  end

  defp serialize_uuid(value), do: value

  defp parse_uuid(%{value: value}) do
    if ValidateUUID.call(value) do
      {:ok, value}
    else
      :error
    end
  end

  defp parse_uuid(_) do
    {:ok, nil}
  end
end
