import gleam/int
import gleam/list
import gleam/string
import gleam/string_builder
import wisp

pub fn ssr_page() {
  let regular_numbers =
    list.range(1, 37)
    |> list.shuffle
    |> list.take(6)
    |> list.sort(by: int.compare)

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
      "<div class='bg-amber-400 text-black w-8 h-8 sm:w-10 sm:h-10 rounded-md flex items-center justify-center text-xl sm:text-2xl font-bold border border-gray-200 dark:border-gray-700'>"
      <> num
      <> "</div>"
    })
    |> string.join("\n")

  let strong_number_html =
    "<div class='bg-red-800 text-white w-8 h-8 sm:w-10 sm:h-10 rounded-md flex items-center justify-center text-xl sm:text-2xl font-bold border border-gray-200 dark:border-gray-700'>"
    <> strong_number
    <> "</div>"

  "
  <!DOCTYPE html>
  <html lang='en'>
  <head>
      <meta charset='UTF-8'>
      <meta name='viewport' content='width=device-width, initial-scale=1.0'>
      <link rel=\"stylesheet\" href=\"/css/styles.css\">
      <script src='/js/network-log.js'></script>
      <title>Magic numbers</title>
  </head>
  <body class='bg-gradient-to-b from-slate-950 via-slate-900 to-slate-800 p-4 min-h-screen'>
  <div class='flex flex-col items-center justify-center'>
      <div class='text-sm font-medium text-center text-gray-500 border-b border-gray-200 dark:text-gray-400 dark:border-gray-700'>
          <ul class='flex flex-nowrap -mb-px overflow-x-auto'>
              <li class='me-2'>
                  <a href='/'
                     class='inline-block p-4 border-b-2 border-transparent rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300'>HOME</a>
              </li>
              <li class='me-2'>
                  <a href='/ssr'
                     class='inline-block p-4 text-blue-600 border-b-2 border-blue-600 rounded-t-lg active dark:text-blue-500 dark:border-blue-500'
                     aria-current='page'>SSR</a>
              </li>
              <li class='me-2'>
                  <a href='/static'
                     class='inline-block p-4 border-b-2 border-transparent rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300'>STATIC</a>
              </li>
              <li class='me-2'>
                  <a href='/spa'
                     class='inline-block p-4 border-b-2 border-transparent rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300'>SPA</a>
              </li>
              <li class='me-2'>
                  <a href='/htmx'
                     class='inline-block p-4 border-b-2 border-transparent rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300'>HTMX</a>
              </li>
          </ul>
      </div>
      <div class='min-h-screen flex flex-col items-center p-4 sm:p-6 md:p-8'>
          <div class='w-full max-w-sm sm:max-w-md md:max-w-lg lg:max-w-xl p-4 bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700 mb-4 sm:mt-6 md:mt-8'>
              <div id='numbers-container' class='flex flex-wrap justify-center gap-2 sm:gap-3'>
                  " <> regular_numbers_html <> " " <> strong_number_html <> "
              </div>
              <a href='/ssr'
                 class='block text-center w-full mt-4 px-4 py-2 bg-blue-500 text-white font-semibold rounded-lg shadow-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-400 focus:ring-opacity-75'>
                  Refresh
              </a>
          </div>
          <div class='w-full text-gray-300 max-w-sm sm:max-w-md md:max-w-lg lg:max-w-xl p-4 bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700'>
              <p>Numbers are generated on the server, and the entire HTML page is sent to the
                  client.</p>
              <p>When the 'Refresh' button is clicked, all assets (HTML, CSS, JS) are reloaded from
                  the server.</p>
              <p>This approach ensures up-to-date content but can result in slower performance due to
                  repeated loading of assets.</p>
          </div>
      </div>

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
