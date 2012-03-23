# show an error

exports.render = (model) -> 
  """
    <html>
      <head>
        <title>Problem with the image</title>
      </head>
      <body>
        There was a problem displaying the image #{model.image_name}
        <p class="error">
          #{model.error}
        </p>
      </body>
    </html>
  """  