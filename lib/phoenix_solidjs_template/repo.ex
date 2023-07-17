defmodule PhoenixSolidJSTemplate.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_solidjs_template,
    adapter: Ecto.Adapters.Postgres
end
