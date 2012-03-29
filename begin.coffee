# The entry point to the application. My personal convention is give the name
# of the file the same name as the application.

# Imports the local `server` module.
server = require './server'

# The server module exports a single `start` function. We pass it the port.
server.start 8989