import gleam/string_builder
import wisp

pub fn home_page() {
  let html =
    "
  <!DOCTYPE html>
  <html lang='en'>
  <head>
      <meta charset='UTF-8'>
      <meta name='viewport' content='width=device-width, initial-scale=1.0'>
      <link rel='stylesheet' href='/css/styles.css'>
      <title>Magic numbers</title></head>
  <body class='bg-gradient-to-b from-slate-950 via-slate-900 to-slate-800 p-4 min-h-screen'>
  <div class='flex flex-col items-center justify-center'>
      <div class='text-sm font-medium text-center text-gray-500 border-b border-gray-200 dark:text-gray-400 dark:border-gray-700'>
          <ul class='flex flex-nowrap -mb-px overflow-x-auto'>
              <li class='me-2'>
                  <a href='/'
                     class='inline-block p-4 text-blue-600 border-b-2 border-blue-600 rounded-t-lg active dark:text-blue-500 dark:border-blue-500'
                     aria-current='page'>HOME</a>
              </li>
              <li class='me-2'><a href='/ssr'
                                  class='inline-block p-4 border-b-2 border-transparent rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300'>SSR</a>
              </li>
              <li class='me-2'><a href='/static'
                                  class='inline-block p-4 border-b-2 border-transparent rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300'>STATIC</a>
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
          <div class='w-full text-gray-300 max-w-sm sm:max-w-md md:max-w-lg lg:max-w-xl p-4 bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700'>
              <p>Welcome to a hands-on exploration of modern web development strategies!<br><br>
                  This site demonstrates the key approaches for building web applications, including
                  Server-Side Rendering (SSR), Static Sites, HTMX for partial updates, and Single Page
                  Applications (SPA).<br><br>
                  Explore each method to understand their unique strengths and use cases.
              </p>
          </div>
          <div class='flex flex-row justify-between w-full'>
              <a href='https://github.com/moshe5745/magic-numbers' target='_blank' class='mt-4 inline-block'>
                  <img src='/images/github.svg' alt='GitHub' class='h-8 w-8 md:h-10 md:w-10'>
              </a>
              <div class='flex flex-row items-center mt-4'>
              <p class='text-gray-300 pe-1'>Made with</p>
              <a href='https://gleam.run' target='_blank' class='inline-block'>
                  <img src='/images/gleam.svg' alt='Gleam' class='h-8 w-8 md:h-10 md:w-10'>
              </a>
              </div>
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
