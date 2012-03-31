# The show action displays an impage

html = require '../lib/html'
view = require '../views/show_error_view'
fs = require 'fs'

exports.show = (http) ->
  match = http.path.match /\/(\w+)$/
  http.image_name = if match then match[1] else 'sad_panda'
  console.log "Display the image #{http.image_name}"
  fs.readFile "./images/#{http.image_name}.png", 'binary', file_loaded(http)

file_loaded = (http) ->
  (error, file) ->
    if not error
      http.respond = html.write_png
      http.respond file
    else
      http.respond = html.write_html
      http.respond view.render({image_name:http.image_name, error}), 500