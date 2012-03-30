# The Not Found Action

# The `not_found` action will render a HTML error page. You'll need the
# HTML helper library and the corresponding view.
html = require '../lib/html'
not_found_view = require '../views/not_found_view'


exports.not_found = (http) ->
  console.log 'Not found action'
  # Attach the HTML helper to the render method
  http.render = html.write_html
  # The not_found_view needs the path as it's view model.
  http.render not_found_view.render(http.path), 404 
