# upload views

exports.render = -> 
  """
  <html>
    <head>
      <title>Image Changed</title>
    </head>
    <body>
      <p>
        The image was uploaded.
      </p>
      <div>
        <img src="/show/uploaded" />
      </div>
      <a href="/start">Click here to start over</a>
    </body>
  </html>
  """