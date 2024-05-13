defmodule Wave.Users do
  @moduledoc """
  Context for managing user
  """

  import Ecto.Query
  alias Wave.User
  alias Wave.Repo

  @spec get_user_by_uid(Ecto.UUID.t()) :: User.t() | nil
  def get_user_by_uid(uid) do
    User
    |> where([u], u.uid == ^uid)
    |> Repo.one()
  end

  @spec create_user(map()) :: {:ok, User.t()} | {:error, Ecto.Changeset.t()}
  def create_user(attrs) do
    attrs
    |> User.changeset()
    |> Repo.insert()
  end
end
