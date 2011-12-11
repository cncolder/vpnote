express = require 'express'
coffeekup = require 'coffeekup'
routes = require './routes'

module.exports = app = express.createServer()

app.configure ->
  app.set 'views', "#{__dirname}/views"
  app.set 'view engine', 'coffee'
  app.register '.coffee', coffeekup.adapters.express
  
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.cookieParser()
  app.use express.session
    secret: 'The secret of vpnote'
  app.use app.router
  app.use express.static "#{__dirname}/public"

app.configure 'development', ->
  app.use express.errorHandler
    dumpExceptions: true
    showStack: true

app.configure 'production', ->
  app.use express.errorHandler()
  app.use express.static "#{__dirname}/public"
    maxAge: 365*24*60*60

app.get '/', routes.index
