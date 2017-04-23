import Foundation

struct Town {
    static let region = "South"
    // Silver challenge:
    // Add a property called mayor of type Mayor
    var mayor = Mayor()
    var population = 5_422 {
        didSet {
            // Bronze Challenge:
            // Only log changes if the new population is less than
            // the old population
            if population < oldValue {
                // Silver Challenge:
                // If the town's population decreases, have the mayor
                // log statement to the console
                mayor.logStatement()
            }
        }
    }
    var numberOfStoplights = 4

    var townSize: Size {
        switch population {
        case 0...10_000:
            return .small
        case 10_001...100_000:
            return .medium
        default:
            return .large
        }
    }

    enum Size {
        case small, medium, large
    }

    func printDescription() {
        print("Population: \(population);", terminator: " ")
        print("number of stoplights: \(numberOfStoplights)")
    }

    mutating func changePopulation(by amount: Int) {
        population += amount
    }
}
