process.env.NODE_ENV = 'test'

module.exports = helper =
  fs: require 'fs'
  path: require 'path'
  vows: require 'vows'
  assert: require 'assert'

helper.cwd = helper.path.resolve __dirname, '..', '..'
