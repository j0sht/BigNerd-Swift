import Foundation

var myTown = Town(population: 5_422, stoplights: 6)
myTown.printDescription()

let fred = Zombie(town: myTown, monsterName: "Fred")
fred.terrorizeTown()
fred.town?.printDescription()

// print("Victim pool: \(fred.victimPool)")
// fred.victimPool = 500
// print("Victim pool: \(fred.victimPool)")
// print(Zombie.makeSpookyNoise)
// if Zombie.isTerrifying {
//     print("RUN")
// }

