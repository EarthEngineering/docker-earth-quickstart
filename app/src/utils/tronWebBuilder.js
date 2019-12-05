const EarthWeb = require("earthweb")
const network = require("../config").network

let instance

module.exports = function() {
  if (!instance) {
    instance = new EarthWeb(network)
  }
  return instance
}
