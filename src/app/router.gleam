import app/web
import gleam/erlang
import gleam/int
import gleam/list
import gleam/set
import gleam/string
import gleam/string_builder
import prng/random
import prng/seed.{type Seed}
import wisp.{type Request, type Response}

/// The HTTP request handler- your application!
///
pub fn handle_request(req: Request) -> Response {
  // Apply the middleware stack for this request/response.
  use _req <- web.middleware(req)

  let seed = seed.new(erlang.system_time(erlang.Nanosecond))

  let #(strong_number, _) = random.step(random.int(1, 7), seed)
  let regular_numbers = generate_distinct(seed)
  let number_strings = list.map(regular_numbers, int.to_string)
  let joined_string = number_strings |> string.join(", ")

  let body =
    string_builder.from_string("<h1>")
    |> string_builder.append(joined_string)
    |> string_builder.append("   #|#   ")
    |> string_builder.append(int.to_string(strong_number))
    |> string_builder.append("</h1>")

  // Return a 200 OK response with the body and a HTML content type.
  wisp.html_response(body, 200)
}

fn generate_distinct(seed: Seed) -> List(Int) {
  let regular_number_gen = random.fixed_size_set(random.int(1, 37), 6)
  let #(regular_numbers_set, _) = regular_number_gen |> random.step(seed)
  let regular_numbers_list = regular_numbers_set |> set.to_list

  case list.length(regular_numbers_list) == 6 {
    True -> regular_numbers_list
    False -> generate_distinct(seed)
  }
}
