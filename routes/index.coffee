module.exports =
  index: (req, res) ->
    res.render 'index'
      title: 'VPNote'
      
  js: require './js'