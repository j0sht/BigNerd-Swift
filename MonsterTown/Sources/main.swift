import Foundation

var myTown = Town()
myTown.changePopulation(by: 500)
myTown.printDescription()

let fredTheZombie = Zombie()
fredTheZombie.town = myTown
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printDescription()
