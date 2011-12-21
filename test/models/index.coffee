{ vows, assert } = require '../helper'

vows

  .describe(String)
  
  .addBatch
  
    'when there is a string.':
      topic: -> 'foobar'
      
      'its length is 6.': (string) ->
        assert.lengthOf string, 6

.export module