# The start action

html = require '../lib/html'
view = require '../views/start_view'

exports.start = (http) ->
  console.log 'Start action invoked'
  http.respond = html.write_html
  http.respond view.render()