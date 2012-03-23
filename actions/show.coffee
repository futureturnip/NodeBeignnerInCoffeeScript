# The show action displays an impage

html = require '../lib/html'
fs = require 'fs'
view = require '../views/show_error_view'

exports.show = (http) ->
  match = http.path.match /\/(\w+)$/
  image_name = if match then match[1] else 'sad_panda'
  console.log "Display the image #{image_name}"
  fs.readFile "./images/#{image_name}.png", 'binary', (error, file) ->
    if not error
      http.respond = html.write_png
      http.respond file
    else
      console.log "Problem with the image #{image_name}: #{error}"
      http.respond = html.write_html
      http.respond view.render({image_name, error}), 500