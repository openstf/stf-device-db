module.exports = function(properties) {
  if (properties.model) {
    //This line of code, removes all spaces in the beggining of each properties.model,
    //Example ' One M8' -> 'One_M8' instead ' One M8' -> '_One_M8'   
    properties.model = properties.model.replace(/^\s+/, '');
    switch (properties.model) {
      case 'Nexus 7':
        switch (properties.name) {
          case 'nakasig':
          case 'nakasi':
            return 'Nexus_7_2012'
          case 'razor':
	    return 'Nexus_7'
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
