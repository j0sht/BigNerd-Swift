import Foundation

var myTown = Town()
let myTownSize = myTown.townSize
print("Size: \(myTown.townSize); population: \(myTown.population)")
myTown.changePopulation(by: 1_000_000)
print("Size: \(myTown.townSize); population: \(myTown.population)")

let fred = Zombie()
fred.town = myTown
fred.terrorizeTown()
fred.town?.printDescription()

print("Victim pool: \(fred.victimPool)")
fred.victimPool = 500
print("Victim pool: \(fred.victimPool)")
