import Foundation

class Zombie: Monster {
    var walksWithLimp = true

    final override func terrorizeTown() {
        town?.changePopulation(by: -10)
        super.terrorizeTown()
    }
}
