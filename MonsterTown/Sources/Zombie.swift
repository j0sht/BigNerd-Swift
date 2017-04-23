import Foundation

class Zombie: Monster {
    var walksWithLimp = true
    override class var makeSpookyNoise: String {
        return "Brains..."
    }
    private(set) var isFallingApart = false
    final override func terrorizeTown() {
        if let pop = town?.population, pop > 0, !isFallingApart {
            town?.changePopulation(by: (pop < 10) ? 0 - pop : -10)
        }
        super.terrorizeTown()
    }
}
