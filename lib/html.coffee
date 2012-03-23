# Html render lib

exports.write_html = (html = '', status = 200) ->
  console.log 'writing html'
  headers = 
    "Content-Type" : "text/html"
    "Content-Length" : html.length

  @response.writeHead status, headers
  @response.end html

exports.write_png = (image) ->
  console.log 'writing image'
  headers =
    "Content-Type" : "image/png"

  @response.writeHead 200, headers
  @response.write image, 'binary'
  @response.end()
