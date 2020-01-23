defmodule PdfRendering.Repo do
  use Ecto.Repo,
    otp_app: :pdf_rendering,
    adapter: Ecto.Adapters.Postgres
end
