# The start action

# Require the HTML helper library and a view for this action.
html = require '../lib/html'
view = require '../views/start_view'

# `start` simply attaches the write_html method to the `http` object and
# responds with the view's rendation. This is probabyl the simpliest of actions.
exports.start = (http) ->
  console.log 'Start action invoked'
  http.respond = html.write_html
  http.respond view.render()