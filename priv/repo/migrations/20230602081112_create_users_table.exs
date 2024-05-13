defmodule Rc.Repo.Migrations.AddUsersTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add(:uid, :uuid, null: false)
      add(:first_name, :string, null: false)
      add(:last_name, :string, null: false)

      timestamps()
    end
  end
end
