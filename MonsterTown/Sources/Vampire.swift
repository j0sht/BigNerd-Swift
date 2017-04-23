import Foundation

class Vampire: Monster {
    private(set) var vampires = [Vampire]()
    
    override func terrorizeTown() {
        vampires.append(Vampire(town: town, monsterName: "Vampire"))
        town?.changePopulation(by: -1)
        super.terrorizeTown()
    }
}
