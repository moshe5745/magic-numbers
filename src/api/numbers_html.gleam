import gleam/int
import gleam/json.{int}
import gleam/list
import gleam/string
import gleam/string_builder
import wisp

pub fn api_numbers_html() {
  let regular_numbers =
    list.range(1, 37)
    |> list.shuffle
    |> list.take(6)
  let assert Ok(strong_number) =
    list.range(1, 7)
    |> list.shuffle
    |> list.first

  let regular_numbers_html =
    list.map(regular_numbers, fn(num) {
      "<div class='bg-amber-400 text-black w-8 h-8 sm:w-10 sm:h-10 rounded-md flex items-center justify-center text-xl sm:text-2xl font-bold border border-gray-200 dark:border-gray-700'>"
      <> int.to_string(num)
      <> "</div>"
    })
    |> string.join("\n")

  let strong_number_html =
    "<div class='bg-red-800 text-white w-8 h-8 sm:w-10 sm:h-10 rounded-md flex items-center justify-center text-xl sm:text-2xl font-bold border border-gray-200 dark:border-gray-700'>"
    <> int.to_string(strong_number)
    <> "</div>"

  let html =
    string_builder.from_string(
      "<div id='numbers-container' class='flex flex-wrap justify-center gap-2 sm:gap-3'>",
    )
    |> string_builder.append(regular_numbers_html)
    |> string_builder.append(strong_number_html)
    |> string_builder.append("</div>")

  wisp.html_response(html, 200)
}
