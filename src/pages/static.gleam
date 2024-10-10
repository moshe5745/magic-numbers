import gleam/string_builder
import wisp

pub fn static_page() {
  let html =
    "
    <!DOCTYPE html>
    <html lang='en'>
    <head>
        <meta charset='UTF-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1.0'>
        <link rel='stylesheet' href='/static/css/styles.css'>
        <script src='/static/js/network-log.js'></script>
        <script src='/static/js/static.js'></script>
        <title>Magic numbers</title></head>
    <body class='bg-gradient-to-b from-slate-950 via-slate-900 to-slate-800 p-4 min-h-screen'>
    <div class='flex flex-col items-center justify-center'>
        <div class='text-sm font-medium text-center text-gray-500 border-b border-gray-200 dark:text-gray-400 dark:border-gray-700'>
            <ul class='flex flex-nowrap -mb-px overflow-x-auto'>
                <li class='me-2'>
                    <a href='/'
                       class='inline-block p-4 border-b-2 border-transparent rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300'>HOME</a>
                </li>
                <li class='me-2'><a href='/ssr'
                                    class='inline-block p-4 border-b-2 border-transparent rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300'>SSR</a>
                </li>
                <li class='me-2'>
                    <a href='/static'
                       class='inline-block p-4 text-blue-600 border-b-2 border-blue-600 rounded-t-lg active dark:text-blue-500 dark:border-blue-500'
                       aria-current='page'>STATIC</a>
                </li>
                <li class='me-2'><a href='/spa'
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
                    <div class='bg-amber-400 text-black w-8 h-8 sm:w-10 sm:h-10 rounded-md flex items-center justify-center text-xl sm:text-2xl font-bold border border-gray-200 dark:border-gray-700'>
                        0
                    </div>
                    <div class='bg-amber-400 text-black w-8 h-8 sm:w-10 sm:h-10 rounded-md flex items-center justify-center text-xl sm:text-2xl font-bold border border-gray-200 dark:border-gray-700'>
                        0
                    </div>
                    <div class='bg-amber-400 text-black w-8 h-8 sm:w-10 sm:h-10 rounded-md flex items-center justify-center text-xl sm:text-2xl font-bold border border-gray-200 dark:border-gray-700'>
                        0
                    </div>
                    <div class='bg-amber-400 text-black w-8 h-8 sm:w-10 sm:h-10 rounded-md flex items-center justify-center text-xl sm:text-2xl font-bold border border-gray-200 dark:border-gray-700'>
                        0
                    </div>
                    <div class='bg-amber-400 text-black w-8 h-8 sm:w-10 sm:h-10 rounded-md flex items-center justify-center text-xl sm:text-2xl font-bold border border-gray-200 dark:border-gray-700'>
                        0
                    </div>
                    <div class='bg-amber-400 text-black w-8 h-8 sm:w-10 sm:h-10 rounded-md flex items-center justify-center text-xl sm:text-2xl font-bold border border-gray-200 dark:border-gray-700'>
                        0
                    </div>
                    <div class='bg-red-800 text-white w-8 h-8 sm:w-10 sm:h-10 rounded-md flex items-center justify-center text-xl sm:text-2xl font-bold border border-gray-200 dark:border-gray-700'>
                        0
                    </div>
                </div>
                <button id='refreshButton'
                        class='w-full mt-4 px-4 py-2 bg-blue-500 text-white font-semibold rounded-lg shadow-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-400 focus:ring-opacity-75'>
                    Refresh
                </button>
            </div>
            <div class='w-full text-gray-300 max-w-sm sm:max-w-md md:max-w-lg lg:max-w-xl p-4 bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700'>
                <p>The entire site is delivered to the client, including a JS script that generates and
                    renders the numbers.</p>
                <p>No network calls are made when the 'Refresh' button is clicked, but business logic is
                    exposed to the client.</p>
                <p>This approach offers fast load times but can compromise security by exposing more
                    logic to the user.</p>
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

  wisp.html_response(string_builder.from_string(html), 200)
}
