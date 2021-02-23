defmodule Zanicpay.Repo do
  use Ecto.Repo,
    otp_app: :zanicpay,
    adapter: Ecto.Adapters.Postgres
end
