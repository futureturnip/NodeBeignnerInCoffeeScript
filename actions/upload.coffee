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
  form.parse http.request, (error, fields, files) ->
    console.log 'form parsed'
    fs.rename files.upload.path, './images/uploaded.png', (error) ->
      console.log 'file rename'
      if not error
        http.respond ok_view.render()
      else
        console.log 'file rename with error'
        fs.unlink './images/uploaded.png'
        fs.rename files.upload.path, './images/uploaded.png', (error) ->
          if not error
            console.log 'file rename worked the second time'
            http.respond ok_view.render()
          else
            http.respond fail_view.render(), 500
