# The Not Found Action

html = require '../lib/html'

exports.not_found = (http) ->
  console.log 'Not found action'
  http.render = html.write_html
  http.render not_found_view(http.path), 404 

not_found_view = (path) ->
  """
    <html>
      <head>
        <title>Oops Not Found</title>
      </head>
      <body>
        <h1>Couldn't find the resource at path "#{path}".</h1>
        <div>
          <img src="/show/sad_panda" />
        </div>
        <a href="/start">Click here to start over.</a>
      </body>
    </html>
  """