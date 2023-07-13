defmodule SolidEx.Repo do
  use Ecto.Repo,
    otp_app: :solid_ex,
    adapter: Ecto.Adapters.Postgres
end
