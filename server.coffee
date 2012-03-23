# The server is responsible for listening on a port for a request

http = require 'http'
url = require 'url'
router = require './router'

handle_request = (request, response) ->
  console.log '*** handling requests ***'
  path = url.parse(request.url).pathname
  router.route { request, response, path }

exports.start = (port) ->
  server = http.createServer handle_request
  server.listen port
  console.log "The Begin server is listening at port #{port}"
