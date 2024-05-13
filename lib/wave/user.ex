defmodule Wave.User do
  @moduledoc """
  User schema
  """
  use Ecto.Schema

  import Ecto.Changeset
  alias Utils.ChangesetUtils

  @type t :: %__MODULE__{
    id: pos_integer(),
    uid: Ecto.UUID.t(),
    first_name: String.t(),
    last_name: String.t()
  }

  @fields [
    :first_name,
    :last_name,
    :uid
  ]

  @required_fields [
    :first_name,
    :last_name,
  ]

  schema "users" do
    field :uid, Ecto.UUID
    field :first_name, :string
    field :last_name, :string

    timestamps()
  end

  def changeset(user \\ %__MODULE__{}, attrs) do
    user
    |> cast(attrs, @fields)
    |> ChangesetUtils.append_uid()
    |> validate_required(@required_fields)
  end
end
