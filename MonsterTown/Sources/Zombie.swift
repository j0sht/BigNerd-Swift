import Foundation

class Zombie: Monster {
    var walksWithLimp = true

    final override func terrorizeTown() {
        if let pop = town?.population, pop > 0 {
            town?.changePopulation(by: (pop < 10) ? 0 - pop : -10)
        }
        super.terrorizeTown()
    }
}
