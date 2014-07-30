module.exports = function(properties) {
  if (properties.model) {
    switch (properties.model) {
      case 'Nexus 7':
        switch (properties.name) {
          case 'nakasig':
          case 'nakasi':
            return 'Nexus_7_2012'
          case 'razor':
          case 'razorg':
            return 'Nexus_7_2013'
        }
        return 'Nexus_7_2012'
      default:
        return properties.model.replace(/ /g, '_')
    }
  }
  else {
    return null
  }
}
