class log
  constructor: (@content) ->
  
  isPPP: ->
    /pppd\[\d+\]\:/.test @content

exports.log = log