# upload fail view

exports.render = ->
  """
  <html>
    <head>
      <title>The upload failed</title>
    </head>
    <body>
      <h1>Sorry the image upload did not work</h1>
      <div>
        <img src="/show/sad_panda" />
      </div>
      <a href="/start">Click here to start over</a>
    </body>
  </html>
  """