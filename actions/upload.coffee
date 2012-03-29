# The upload action

html = require '../lib/html'
formidable = require 'formidable'
fs = require 'fs'
ok_view = require '../views/upload_success_view'
fail_view = require '../views/upload_fail_view'

exports.upload = (http) ->
  console.log "Upload starting"
  http.respond = html.write_html  
  form = new formidable.IncomingForm
  form.parse http.request, form_parsed(http)

# Callback method chain.

form_parsed = (http) ->
  (error, fields, files) ->
    console.log 'form parsed'
    fs.rename files.upload.path, './images/uploaded.png', image_renamed(http, files)

image_renamed = (http, files) ->
  (error) ->
    console.log 'file rename'
    if not error
      http.respond ok_view.render()
    else
      console.log 'file rename with error'
      fs.unlink './images/uploaded.png'
      fs.rename files.upload.path, './images/uploaded.png', second_try(http)

second_try = (http) ->
  (error) ->
    if not error
      console.log 'file rename worked the second time'
      http.respond ok_view.render()
    else
      http.respond fail_view.render(), 500