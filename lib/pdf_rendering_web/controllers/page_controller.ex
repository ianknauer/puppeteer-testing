defmodule PdfRenderingWeb.PageController do
  use PdfRenderingWeb, :controller
  import IEx

  def index(conn, _params) do

    html = Phoenix.View.render_to_string(PdfRenderingWeb.PageView, "index.html", [layout: {PdfRenderingWeb.LayoutView, "pdf.html"}, conn: conn, css: "#{ Application.app_dir(:pdf_rendering, "priv/static/css/app.css")}"])

    IO.inspect(html)

    pdf_path = Path.absname("invoice.pdf")

    options = [
      format: "A4",
      print_background: true,
      debug: true,
      timeout: 10000 # value passed directly to Task.await/2. (Defaults to 5000)
    ]

    case PuppeteerPdf.Generate.from_string(html, pdf_path, options) do
      {:ok, _} ->
        render(conn, "index.html")
      {:error, _} ->
        render(conn, "index.html")
    end
  end
end
