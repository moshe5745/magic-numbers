import gleam/string_builder
import wisp

pub fn htmx_page() {
  let html =
    "
    <!DOCTYPE html>
    <html lang='en'>
    <head>
        <meta charset='UTF-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1.0'>
        <link rel=\"stylesheet\" href=\"/static/css/styles.css\">
        <script src='https://unpkg.com/htmx.org@2.0.3'></script>
        <script src='/static/js/network-log.js'></script>
        <title>Magic numbers</title>
    </head>
    <body class='font-sans bg-gradient-to-b from-slate-950 via-slate-900 to-slate-800 p-4 min-h-screen'>
    <div class='flex flex-col items-center justify-center'>
        <div class='text-sm font-medium text-center text-gray-500 border-b border-gray-200 dark:text-gray-400 dark:border-gray-700'>
            <ul class='flex flex-nowrap -mb-px overflow-x-auto'>
                <li class='me-2'>
                    <a href='/'
                       class='inline-block p-4 border-b-2 border-transparent rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300'>HOME</a>
                </li>
                <li class='me-2'>
                    <a href='/ssr'
                       class='inline-block p-4 border-b-2 border-transparent rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300'>SSR</a>
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
                       class='inline-block p-4 text-blue-600 border-b-2 border-blue-600 rounded-t-lg active dark:text-blue-500 dark:border-blue-500'
                       aria-current='page'>HTMX</a>
                </li>
            </ul>
        </div>
        <div class='min-h-screen flex flex-col items-center p-4 sm:p-6 md:p-8'>
            <div class='w-full max-w-sm sm:max-w-md md:max-w-lg lg:max-w-xl p-4 bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700 mb-4 sm:mt-6 md:mt-8'>
                <div id='numbers-container' class='flex flex-wrap justify-center gap-2 sm:gap-3'>
                </div>
                <button hx-get='/api/numbers_html' hx-trigger='load, click'
                        hx-target='#numbers-container'
                        class='w-full mt-4 px-4 py-2 bg-blue-500 text-white font-semibold rounded-lg shadow-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-400 focus:ring-opacity-75'>
                    Refresh
                </button>
            </div>
            <div class='w-full text-gray-300 max-w-sm sm:max-w-md md:max-w-lg lg:max-w-xl p-4 bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700'>
                <p>Numbers are generated on the server, and the entire HTML page is sent to the
                    client.</p>
                <p>When the 'Refresh' button is clicked, only the numbers div are reloaded from the
                    server.</p>
                <p>This approach ensures up-to-date content and fast interaction loads</p>
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
