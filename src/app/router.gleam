import app/web.{type Context}
import gleam/int
import gleam/list
import gleam/string
import gleam/string_builder
import wisp.{type Request, type Response}

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
  let html =
    string_builder.from_string(generate_html(
      number_strings,
      int.to_string(strong_number),
    ))

  wisp.html_response(html, 200)
}

pub fn generate_html(
  regular_numbers: List(String),
  strong_number: String,
) -> String {
  let regular_numbers_html =
    list.map(regular_numbers, fn(num) {
      "<div class='bg-amber-400 text-black w-10 h-10 rounded-md flex items-center justify-center text-2xl font-bold'>"
      <> num
      <> "</div>"
    })
    |> string.join("\n")

  let strong_number_html =
    "<div class='bg-red-800 text-white w-10 h-10 rounded-md flex items-center justify-center text-2xl font-bold'>"
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
  <body class='bg-gradient-to-b from-slate-950 via-slate-900 to-slate-800 p-4 min-h-screen flex items-center justify-center'>
  <div class='max-w-sm p-4 bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700'>
      <div class='flex flex-wrap justify-center gap-3'>" <> regular_numbers_html <> " " <> strong_number_html <> "</div>
  </div>
  </body>
  <div class='firefly'></div>
  <div class='firefly'></div>
  <div class='firefly'></div>
  <div class='firefly'></div>
  <div class='firefly'></div>
  <div class='firefly'></div>
  <div class='firefly'></div>
  <div class='firefly'></div>
  <div class='firefly'></div>
  <div class='firefly'></div>
  <div class='firefly'></div>
  <div class='firefly'></div>
  <div class='firefly'></div>
  <div class='firefly'></div>
  <div class='firefly'></div>
  <div class='firefly'></div>
  <div class='firefly'></div>
  <div class='firefly'></div>
  <div class='firefly'></div>
  <div class='firefly'></div>
  </html>
  "
}
