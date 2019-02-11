var data = require('./dist/devices-latest.json')
var mapping = require('./mapping')

module.exports.find = function(properties) {
  var id = mapping(properties)
    , match

  if (id && (match = data[id])) {
    match.image = match.image || id + '.jpg'
    return match
  }

  return null
}
