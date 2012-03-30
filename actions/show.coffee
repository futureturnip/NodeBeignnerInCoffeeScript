# The show action displays an impage

# Require the HTML helper library, an error view, and the node filesystem.
html = require '../lib/html'
view = require '../views/show_error_view'
fs = require 'fs'

# `show` has the job of reading a binary image file and writing that 
# to the response.
exports.show = (http) ->
  # Primitive form of URI parameter matching.
  match = http.path.match /\/(\w+)$/
  http.image_name = if match then match[1] else 'sad_panda'
  # Read the file (yes, hard-coded as a .png). Use the closure method on the
  # callback function.
  console.log "Display the image #{http.image_name}"
  fs.readFile "./images/#{http.image_name}.png", 'binary', file_loaded(http)

# The `file_loaded` callback function uses a closure to remember the `http` object.
# This callback function is actually returning a function. This also has the
# effect of reducint the indentation effect of the asynchronous callbacks.
file_loaded = (http) ->
  (error, file) ->
    if not error
      http.respond = html.write_png
      http.respond file
    else
      http.respond = html.write_html
      http.respond view.render({image_name:http.image_name, error}), 500