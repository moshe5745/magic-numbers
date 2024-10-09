import app/web.{type Context}
import gleam/int
import gleam/list
import gleam/string
import gleam/string_builder
import wisp.{type Request, type Response}

/// The HTTP request handler- your application!
///
pub fn handle_request(req: Request, ctx: Context) -> Response {
  use _req <- web.middleware(req, ctx)

  let regular_numbers =
    list.range(1, 37)
    |> list.shuffle
    |> list.take(6)
  let assert Ok(strong_number) =
    list.range(1, 7)
    |> list.shuffle
    |> list.first

  let number_strings = list.map(regular_numbers, int.to_string)
  // let joined_string = number_strings |> string.join(", ")
  let html =
    string_builder.from_string(generate_lottery_html(
      number_strings,
      int.to_string(strong_number),
    ))

  // Return a 200 OK response with the body and a HTML content type.
  wisp.html_response(html, 200)
}

pub fn generate_lottery_html(
  regular_numbers: List(String),
  strong_number: String,
) -> String {
  let regular_numbers_html =
    list.map(regular_numbers, fn(num) {
      "<div class='bg-blue-500 text-white w-16 h-16 rounded-full flex items-center justify-center text-2xl font-bold'>"
      <> num
      <> "</div>"
    })
    |> string.join("\n")

  let strong_number_html =
    "<div class='bg-red-500 text-white w-16 h-16 rounded-full flex items-center justify-center text-2xl font-bold'>"
    <> strong_number
    <> "</div>"

  "
  <!DOCTYPE html>
  <html lang='en'>
  <head>
      <meta charset='UTF-8'>
      <meta name='viewport' content='width=device-width, initial-scale=1.0'>
      <link rel=\"stylesheet\" href=\"/static/css/styles.css\">
      <title>Lottery Numbers</title>
  </head>
  <body class='bg-gray-100 min-h-screen flex items-center justify-center'>
      <div class='bg-white p-8 rounded-xl shadow-lg w-full max-w-md'>
          <h1 class='text-2xl font-bold text-center mb-6'>Magic numbers</h1>
          <div class='flex flex-wrap justify-center gap-4'>" <> regular_numbers_html <> " " <> strong_number_html <> "</div>
      </div>
  </body>
  </html>
  "
}
