# The upload action

# `upload` is the most complicated action. It has multiple callbacks, renders
# multiple views based on success or failure, and parses the incoming form.
html = require '../lib/html'
formidable = require 'formidable'
fs = require 'fs'
ok_view = require '../views/upload_success_view'
fail_view = require '../views/upload_fail_view'

# `upload` attaches the `write_html` method to the current `http` object,
# parses the incoming form, and uses the closure technique for the callback.
exports.upload = (http) ->
  console.log "Upload starting"
  http.respond = html.write_html  
  form = new formidable.IncomingForm
  form.parse http.request, form_parsed(http)

## Callback method chain.

# `form_parsed` is the first callback. It captures the result from parsing
# the incoming form with the `formidable` library. It captures the `http` object
# and returns the actual method to be called back.
form_parsed = (http) ->
  (error, fields, files) ->
    console.log 'form parsed'
    fs.rename files.upload.path, './images/uploaded.png', image_renamed(http, files)

# `image_renamed` is the second callback. It captures the http object and the 
# `files` parameter (which is the list of files from the `formidable` object).
# The returns a function called by the `fs.rename` call.
image_renamed = (http, files) ->
  (error) ->
    console.log 'file rename'
    if not error
      http.respond ok_view.render()
    else
      # Have to give Windows a second chance.
      console.log 'file rename with error'
      fs.unlink './images/uploaded.png'
      fs.rename files.upload.path, './images/uploaded.png', second_try(http)

# `second_try` is the callback function for the second attempt at renaming
# the uploaded file. It captures the `http` object and returns the function
# called by the second call to `fs.rename`.
second_try = (http) ->
  (error) ->
    if not error
      console.log 'file rename worked the second time'
      http.respond ok_view.render()
    else
      http.respond fail_view.render(), 500