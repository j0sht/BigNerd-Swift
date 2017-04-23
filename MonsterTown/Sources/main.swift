import Foundation

var myTown = Town()
myTown.changePopulation(by: 500)
myTown.printDescription()

let fredTheZombie = Zombie()
fredTheZombie.town = myTown
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printDescription()

// Bronze challenge test
var yourTown = Town()
yourTown.population = 7
yourTown.printDescription()
let jillTheZombie = Zombie()
jillTheZombie.town = yourTown
jillTheZombie.terrorizeTown()
jillTheZombie.town?.printDescription()
jillTheZombie.terrorizeTown()
jillTheZombie.town?.printDescription()

// Silver challenge test
var deadTown = Town()
deadTown.printDescription()
let spike = Vampire()
spike.town = deadTown
print("Spikes vampires: \(spike.vampires)")
spike.terrorizeTown()
print("Spikes vampires: \(spike.vampires)")
spike.town?.printDescription()
