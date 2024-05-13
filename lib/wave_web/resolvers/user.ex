defmodule WaveWeb.Resolvers.User do
  @moduledoc """
  GraphQL resolver for user
  """

  alias Wave.User
  alias Wave.Users

  @spec get_user(map(), map()) :: {:ok, User.t()} | {:error, String.t()}
  def get_user(%{uid: uid}, _) do
    {:ok, Users.get_user_by_uid(uid)}
  end

  @spec create_user(map(), map()) :: {:ok, User.t()} | {:error, String.t()}
  def create_user(%{first_name: first_name, last_name: last_name}, _) do
    case Users.create_user(%{first_name: first_name, last_name: last_name}) do
      {:ok, %User{} = user} -> {:ok, user}
      {:error, %Ecto.Changeset{} = changeset} -> {:error, changeset}
    end
  end
end
