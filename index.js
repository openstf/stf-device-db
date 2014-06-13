var publicData = require('./dist/devices-latest')
var staticData = require('./static/devices-static')
var mapping = require('./mapping')

module.exports.find = function(properties) {
  var uniqueId = properties.model
  var problem = mapping(properties)

  if (problem) {
    uniqueId = problem

    if (staticData[uniqueId]) {
      return staticData[uniqueId]
    }
  }

  if (publicData[uniqueId]) {
    return publicData[uniqueId]
  }

  return null
}
