class Monster {
    static let isTerrifying = true
    class var makeSpookyNoise: String {
        return "Grr.."
    }
    var town: Town?
    var name: String
    var victimPool: Int {
        get {
            return town?.population ?? 0
        }
        set {
            town?.population = newValue
        }
    }

    required init(town: Town?, monsterName: String) {
        self.town = town
        name = monsterName
    }

    func terrorizeTown() {
        if town != nil {
            print("\(name) is terrorizing a town! 😈")
        } else {
            print("\(name) hasn't found a town to terrorize yet...")
        }
    }
}
