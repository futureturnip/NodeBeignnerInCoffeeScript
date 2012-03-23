# Start view

exports.render = -> 
  """
  <html>
    <head>
      <title>The Node Beginner (in CoffeeScript)</title>
    </head>
    <body>
      <h1>The Node Beginner (in CoffeeScript)</h1>
      <i>The currently uploaded image:</i>
      <div>
        <img src="/show/uploaded" />
      </div>
      <form action="/upload" enctype="multipart/form-data" method="post">
        <input type="file" name="upload" multiple="multiple" />
        <input type="submit" value="Upload file" />
      </form>
    </body>
  </html>
  """
