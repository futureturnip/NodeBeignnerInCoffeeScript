# The server is responsible for listening on a port for a request

# The require function returns a module.
# CoffeeScript creates a module by default as one per file.
http = require 'http'
url = require 'url'
router = require './router'

# Functions that use the special `exports` object become available when they
# are required from other files. The `start` function simply creates the
# canonical node.js http server, passing control to the `handle_request` 
# function when a request is received on the specified port.
exports.start = (port) ->
  server = http.createServer handle_request
  server.listen port
  console.log "The Begin server is listening at port #{port}"

# `handle_request` parses the request URL and bundles the request, response,
# and the parsed path into an object to hand to the router.
handle_request = (request, response) ->
  console.log '*** handling requests ***'
  path = url.parse(request.url).pathname
  router.route { request, response, path }

