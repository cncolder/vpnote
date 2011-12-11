#!/usr/bin/env coffee

cluster = require 'cluster'

module.exports = app = require './app'

port = process.env.PORT
count = require('os').cpus().length

switch process.env.NODE_ENV ? 'development'
  when 'development'
    port ?= 3000
    count = 1
  when 'test'
    port ?= 3001
    count = 1
  when 'staging'
    port ?= 3002
  when 'production'
    port ?= 3003

unless module.parent
  if cluster.isMaster
    for i in [1..count]
      worker = cluster.fork()
      console.log 'worker ' + worker.pid + ' forked.'
      
    cluster.on 'death', (worker) ->
      console.log 'worker ' + worker.pid + ' died.'
  else
    app.listen port
    console.log """
      Express server listening on port #{app.address()?.port} in #{app.settings.env} mode.
    """
