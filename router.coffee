# Router determines what to do with the requested path

action = (name) ->
  require("./actions/#{name}")[name]

routes = 
  "/": action('start')
  "/start": action('start')
  "/show/uploaded": action('show')
  "/show/sad_panda": action('show')
  "/upload":action('upload')

exports.route = (http) ->
  console.log "Routing #{http.path}"
  process = routes[http.path] ? action('not_found')
  process http