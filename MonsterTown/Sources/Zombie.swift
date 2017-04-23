import Foundation

class Zombie: Monster {
    var walksWithLimp: Bool
    private(set) var isFallingApart: Bool
    override class var makeSpookyNoise: String {
        return "Brains..."
    }
    init(limp: Bool, fallingApart: Bool, town: Town?, monsterName: String) {
        // Because this is a designated initializer, it must
        // initialize all values specific to this class
        // before calling super.init
        walksWithLimp = limp
        isFallingApart = fallingApart
        super.init(town: town, monsterName: monsterName)
    }
    convenience init(limp: Bool, fallingApart: Bool) {
        self.init(limp: limp, fallingApart: fallingApart,
                  town: nil, monsterName: "Fred")
        if walksWithLimp {
            print("This zombie has a bad knee 🤕")
        }
    }
    required init(town: Town?, monsterName: String) {
        walksWithLimp = false
        isFallingApart = false
        super.init(town: town, monsterName: monsterName)
    }
    deinit {
        print("Zombie named \(name) is no longer with us. 💀")
    }
    final override func terrorizeTown() {
        if let pop = town?.population, pop > 0, !isFallingApart {
            town?.changePopulation(by: (pop < 10) ? 0 - pop : -10)
        }
        super.terrorizeTown()
    }
}
