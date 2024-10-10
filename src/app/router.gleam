import api/numbers.{api_numbers}
import api/numbers_html.{api_numbers_html}
import app/web.{type Context}
import pages/home.{home_page}
import pages/htmx.{htmx_page}
import pages/spa.{spa_page}
import pages/ssr.{ssr_page}
import pages/static.{static_page}
import wisp.{type Request, type Response}

pub fn handle_request(req: Request, ctx: Context) -> Response {
  use _req <- web.middleware(req, ctx)

  case wisp.path_segments(req) {
    [] -> home_page()
    ["ssr"] -> ssr_page()
    ["static"] -> static_page()
    ["spa"] -> spa_page()
    ["api", "numbers"] -> api_numbers()
    ["api", "numbers_html"] -> api_numbers_html()
    ["htmx"] -> htmx_page()
    _ -> wisp.not_found()
  }
}
