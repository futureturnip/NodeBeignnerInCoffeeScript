## Html render lib

# `write_html` uses is a function that assumes it has been attached to another
# object that contains a `response` object. It uses default parameters for the
# message body and the return status code.
exports.write_html = (html = '', status = 200) ->
  console.log 'writing html'
  
  # This is CoffeeScript syntax for creating an object literal.
  headers = 
    "Content-Type" : "text/html"
    "Content-Length" : html.length

  @response.writeHead status, headers
  @response.end html

# `write_png` has the same assumptions. It writes the appropriate header and
# handles the binary file.
exports.write_png = (image) ->
  console.log 'writing image'
  headers =
    "Content-Type" : "image/png"

  @response.writeHead 200, headers
  @response.write image, 'binary'
  @response.end()
