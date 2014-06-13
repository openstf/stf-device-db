module.exports = function(properties) {
  switch (properties.model) {
    case 'Nexus 5':
      return properties.model + '|' + properties.name
    case 'Nexus 7':
      return properties.model + '|' + properties.name
    default:
      return null
  }
}
