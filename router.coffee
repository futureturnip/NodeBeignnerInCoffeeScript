# Router determines what to do with the requested path

# `action` is a helper method that looks up the action in the actions
# directory. By convention, the actions all export a single function equal to
# their file name. The `action` function here returns another function (the
# referenced action).
action = (name) ->
  require("./actions/#{name}")[name]

# The routes table maps the request path to an action. The actions themselves
# are functions that expect an object containing a request, response, and path
routes = 
  "/": action('start')
  "/start": action('start')
  "/show/uploaded": action('show')
  "/show/sad_panda": action('show')
  "/upload": action('upload')

# `route` is the only exported function in the `Router` module. The `http`
# parameter is a bundled object containing the request, response, and path
# objects. `route` looks up the method in the route table and sends `http`
# object for further processing 
exports.route = (http) ->
  console.log "Routing #{http.path}"
  process = routes[http.path] ? action('not_found')
  process http