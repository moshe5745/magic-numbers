import app/web
import gleam/erlang
import gleam/int
import gleam/io
import gleam/json
import gleam/list
import gleam/string
import gleam/string_builder
import prng/random.{type Generator}
import prng/seed
import wisp.{type Request, type Response}

/// The HTTP request handler- your application!
///
pub fn handle_request(req: Request) -> Response {
  // Apply the middleware stack for this request/response.
  use _req <- web.middleware(req)

  let seed = seed.new(erlang.system_time(erlang.Nanosecond))
  let regular_number_gen = random.int(1, 37)
  let strong_number_gen = random.int(1, 7)
  let regular_numbers = random.fixed_size_list(regular_number_gen, 6)

  let #(roll_result, _) = regular_numbers |> random.step(seed)
  let #(strong_number, _) = random.step(strong_number_gen, seed)

  let number_strings = list.map(roll_result, int.to_string)
  let joined_string = string.join(number_strings, ", ")

  let body =
    string_builder.from_string("<h1>")
    |> string_builder.append(joined_string)
    |> string_builder.append("   #|#   ")
    |> string_builder.append(int.to_string(strong_number))
    |> string_builder.append("</h1>")

  // Return a 200 OK response with the body and a HTML content type.
  wisp.html_response(body, 200)
}
