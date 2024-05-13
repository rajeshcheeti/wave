defmodule Utils.ValidateUUID do
  @moduledoc """
  Utility to check UUID is valid
  """

  @uid_regex "[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}"

  @spec call(String.t() | nil) :: boolean()
  def call(nil), do: false
  def call(uid), do: Regex.match?(~r/#{@uid_regex}/, uid)
end
