fs = require 'fs'
coffee = require 'coffee-script'

module.exports = (req, res, next) ->
  sourceFile = "#{req.app.settings.views}#{req.params[0]}.coffee"
  fs.readFile sourceFile, 'utf8', (err, data) ->
    if err
      next()
    else
      res.contentType 'js'
      res.send coffee.compile data