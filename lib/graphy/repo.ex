defmodule Graphy.Repo do
  use Ecto.Repo,
    otp_app: :graphy,
    adapter: Ecto.Adapters.Postgres
end
