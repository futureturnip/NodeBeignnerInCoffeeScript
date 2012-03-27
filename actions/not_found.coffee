# The Not Found Action

html = require '../lib/html'
{not_found_view} = require '../views/not_found_view'


exports.not_found = (http) ->
  console.log 'Not found action'
  http.render = html.write_html
  http.render not_found_view(http.path), 404 
