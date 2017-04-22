import Foundation

class Zombie: Monster {
    var walksWithLimp = true

    final override func terrorizeTown() {
        guard let t = town, t.population > 0  else {
            super.terrorizeTown()
            return
        }
        let pop = t.population
        town?.changePopulation(by: (pop < 10) ? 0 - pop : -10)
        super.terrorizeTown()
    }
}
