# not found view

exports.render = (path) ->
  """
    <html>
      <head>
        <title>Oops Not Found</title>
      </head>
      <body>
        <h1>Couldn't find the resource at path "#{path}".</h1>
        <div>
          <img src="/show/sad_panda" />
        </div>
        <a href="/start">Click here to start over.</a>
      </body>
    </html>
  """