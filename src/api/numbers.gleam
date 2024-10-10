import gleam/json.{int}
import gleam/list
import wisp

pub fn api_numbers() {
  let regular_numbers =
    list.range(1, 37)
    |> list.shuffle
    |> list.take(6)
  let assert Ok(strong_number) =
    list.range(1, 7)
    |> list.shuffle
    |> list.first

  let object =
    json.object([
      #("regular_numbers", json.array(from: regular_numbers, of: int)),
      #("strong_number", json.int(strong_number)),
    ])

  wisp.json_response(json.to_string_builder(object), 200)
}
