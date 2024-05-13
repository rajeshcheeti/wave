defmodule Utils.ChangesetUtils do
  @moduledoc """
  Changeset utility functions
  """

  import Ecto.Changeset,
    only: [get_field: 2, put_change: 3]

  alias Ecto.UUID

  @doc """
  Adds a UID onto a changeset if doesn't already exist
  """
  @spec append_uid(Ecto.Changeset.t()) :: Ecto.Changeset.t()
  def append_uid(changeset) do
    IO.inspect(changeset, label: "changeset------*****")
    case get_field(changeset, :uid) do
      nil -> put_change(changeset, :uid, UUID.generate())
      _ -> changeset
    end
  end
end
