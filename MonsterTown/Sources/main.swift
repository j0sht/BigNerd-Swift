import Foundation

var myTown = Town(population: 5_422, stoplights: 6)
myTown.printDescription()

var fred: Zombie? = Zombie(limp: false, fallingApart: false,
                           town: myTown, monsterName: "Fred")
fred?.terrorizeTown()
fred?.town?.printDescription()

let convenientZombie = Zombie(limp: true, fallingApart: false)
fred = nil
