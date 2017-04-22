import Foundation

var myTown = Town()
myTown.changePopulation(by: 500)
myTown.printDescription()
let genericMonster = Monster()
genericMonster.town = myTown
genericMonster.terrorizeTown()
